;;; extensions.el --- leo Layer extensions File for Spacemacs

(defun leo/comment-or-uncomment-line-or-region ()
  "Comments or uncomments the current line or region."
  (interactive)
  (if (region-active-p)
      (comment-or-uncomment-region (region-beginning) (region-end))
    (comment-or-uncomment-region (line-beginning-position) (line-end-position))))

(defun leo/comment-or-uncomment-region-linewise ()
  (interactive)
  (apply-macro-to-region-lines (region-beginning) (region-end) [?\s-/])
  (indent-region (region-beginning) (region-end)))

(defun leo/goto-line ()
  (interactive)
  (spacemacs/toggle-line-numbers-on)
  (unwind-protect
      (call-interactively 'goto-line)
    (spacemacs/toggle-line-numbers-off)))

(defun leo/goto-match-beginning ()
  (when (and isearch-forward isearch-other-end (not isearch-mode-end-hook-quit))
    (goto-char isearch-other-end)))

(defun leo/kill-region-or-hybrid-sexp (&optional ARG)
  (interactive "P")
  (if (region-active-p)
      (kill-region (region-beginning) (region-end))
    (sp-kill-hybrid-sexp ARG)))

(defun leo/open-in-iterm ()
  (interactive)
  (let ((workdir (cadr (split-string (pwd) "Directory "))))
    (shell-command (format "open \"%s\" -a \"iTerm\"" workdir))))

(defun leo/open-file-from-class-at-point ()
  (interactive)
  (kill-new (string-inflection-underscore-function (thing-at-point 'symbol)))
  ;; Open helm-projectile-find-file, yank, go.
  ;; '((M-m p f) (C-y) (<RET>))
  (kmacro-exec-ring-item `([134217837 112 102 25 return] 0 "%d") 1))

(defun leo/--newline-wrap-region (pair &rest _ignored)
  (unless (region-active-p)
    (set-mark-command nil)
    (move-end-of-line nil))
  (kill-region (region-beginning) (region-end))
  (sp-insert-pair pair)
  (execute-kbd-macro (kbd "RET"))
  (yank)
  (set-mark-command t))

(defun leo/newline-wrap-region-with-braces ()
  (interactive)
  (leo/--newline-wrap-region "{"))

(defun leo/newline-wrap-region-with-brackets ()
  (interactive)
  (leo/--newline-wrap-region "["))

(defun leo/newline-unwrap-sexp ()
  (interactive)
  (sp-backward-up-sexp)
  (sp-unwrap-sexp)
  (kill-line)
  (just-one-space))

(defun leo/kill-and-print-working-dir ()
  (interactive)
  (kill-new (cadr (split-string (pwd) "Directory ")))
  (pwd))
