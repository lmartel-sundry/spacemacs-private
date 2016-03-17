(defun shasana-tramp-find-files (abbreviated-dest)
  (interactive "sHELM Find Files: [user@]host[:path] ")
  (shasana--tramp-impl abbreviated-dest 'helm-find-files-1))

(defun shasana-tramp-find-file (abbreviated-dest)
  "Use this entrypoint to fall back to the native `find-file' if Helm is not available or causing issues."
  (interactive "sFind File: [user@]host[:path] ")
  (shasana--tramp-impl abbreviated-dest 'find-file))

(defun shasana-init ()
  (eval-after-load "tramp"
    '(progn (add-to-list 'tramp-methods
                         '("sshproxy_root"
                           (tramp-login-program        "sudo")
                           (tramp-login-args           (("-u" "sshproxy_root")
                                                        ("ssh")
                                                        ("-t")
                                                        ("%u@%h")))
                           (tramp-login-env            (("SHELL") ("/bin/sh")))
                           (tramp-remote-shell         "/bin/sh")
                           (tramp-remote-shell-login   ("-l"))
                           (tramp-remote-shell-args    ("-c"))
                           (tramp-connection-timeout   10)))

            (add-to-list 'tramp-methods
                         '("push"
                           (tramp-login-program        "sudo")
                           (tramp-login-args           (("-u" "push")
                                                        ("ssh")
                                                        ("-t")
                                                        ("%u@%h")))
                           (tramp-login-env            (("SHELL") ("/bin/sh")))
                           (tramp-remote-shell         "/bin/sh")
                           (tramp-remote-shell-login   ("-l"))
                           (tramp-remote-shell-args    ("-c"))
                           (tramp-connection-timeout   10))))))


(defun shasana--tramp-impl (abbreviated-dest callback)
  (exec-path-from-shell-copy-envs '("CODEZ" "ASANA_GIT_NAME" "ASANA_GIT_EMAIL"))
  (let* ((alias-and-path (split-string abbreviated-dest ":"))
         (command (shell-command-to-string (concat "python " (getenv "CODEZ") "/bin/shasana.py " (car alias-and-path))))
         (hops (shasana--parse-hops command))
         (destination (car hops)))
    (shasana--set-proxies hops)
    (funcall callback (concat "/" (shasana--tramp-method hops) ":" destination ":" (shasana--remote-path (cadr alias-and-path))))))

(defun shasana--tramp-method (hops)
  (cond ((and (= 3 (length hops)) (string= "root" (shasana--user (car hops))))
         "push")
        ((= 3 (length hops))
         "ssh")
        ((= 2 (length hops))
         "sshproxy_root")
        (t (error "Unexpected number of shasana hops: %s" hops))))

(defun shasana--set-proxies (hops)
  "Hops is a list of user@host in reverse order,
e.g. `(destination bastion sshproxy)'.

Proxy `*@second -> ssh:localuser@first'.
Proxy `*@third -> sshproxy_root:%u@second' as well if there's a third hop."
  (cond ((= 3 (length hops)) (progn
                               (shasana--set-proxies (cdr hops))
                               (add-to-list 'tramp-default-proxies-alist
                                            `(,(shasana--host (car hops))
                                              nil
                                              ,(concat "/sshproxy_root:%u@" (shasana--host (cadr hops)) ":")))))
        ((= 2 (length hops)) (add-to-list 'tramp-default-proxies-alist
                                          `(,(shasana--host (car hops))
                                            nil
                                            ,(concat "/ssh:" (cadr hops) ":"))))
        (t (error "Unexpected number of shasana hops: %s" hops))))

(defun shasana--user (destination)
  (car (split-string destination "@")))

(defun shasana--host (destination)
  (cadr (split-string destination "@")))

(defun shasana--remote-path (&optional partial-path)
  "Intelligently assemble an absolute path from an input path.

Starts with /, it's absolute.
Starts without /, it's relative to default CODEZ directory.
Not provided, just return the default CODEZ directory."
  (if (and (stringp partial-path) (string-prefix-p "/" partial-path))
      partial-path
    (concat "/var/asana-config/asana/" (or partial-path ""))))

(defun shasana--parse-hops (command)
  "Parse all the user@host substrings from the input string, returning them in REVERSE order."
  (setq shasana-host-match 0)
  (setq shasana-matched-hosts ())
  (while (not (eq nil shasana-host-match))
    (if (string-match "[^ ]+@[^ ]+" command shasana-host-match)
        (progn
          (setq shasana-host-match (cadr (match-data)))
          (add-to-list 'shasana-matched-hosts (substring command (car (match-data)) (cadr (match-data)))))
      (setq shasana-host-match nil)))
  shasana-matched-hosts)
