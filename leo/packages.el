;;; packages.el --- leo Layer packages File for Spacemacs
;;
;; Copyright (c) 2012-2014 Sylvain Benner
;; Copyright (c) 2014-2015 Sylvain Benner & Contributors
;;
;; Author: Sylvain Benner <sylvain.benner@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;; List of all packages to install and/or initialize. Built-in packages
;; which require an initialization must be listed explicitly in the list.
(setq leo-packages
      '(
        ;; package names go here
        crontab-mode
        dumb-jump

	;; local extensions and dependencies
	(extensions :location local)
	string-inflection
        thingatpt+ 
        ))

;; List of packages to exclude.
(setq leo-excluded-packages '())

;;; FYI: list of packages included with spacemacs-base (builtins excluded). These are all implicitly installed.
;;
;; (async bind-key dash diminish elisp-slime-nav epl evil evil-escape evil-leader evil-surround evil-visualstar exec-path-from-shell fill-column-indicator goto-chg helm helm-core helm-descbinds helm-projectile ido-vertical-mode macrostep package-build page-break-lines pkg-info popup popwin projectile quelpa s spacemacs-theme undo-tree use-package which-key)
;;; FYI: list of packages included with spacemacs. Most of these are disabled, but can be enabled in .spacemacs
;; (ace-link ace-window adaptive-wrap aggressive-indent auto-dictionary auto-highlight-symbol avy buffer-move centered-cursor clean-aindent-mode define-word desktop doc-view eval-sexp-fu evil-anzu evil-args evil-exchange evil-iedit-state evil-indent-textobject evil-jumper evil-lisp-state evil-nerd-commenter evil-matchit evil-numbers evil-search-highlight-persist evil-terminal-cursor-changer evil-tutor expand-region fancy-battery flx-ido golden-ratio google-translate helm-ag helm-make helm-mode-manager helm-swoop helm-themes highlight-indentation highlight-numbers highlight-parentheses hl-anything hungry-delete info+ iedit indent-guide open-junk-file leuven-theme linum-relative move-text neotree pcre2el powerline rainbow-delimiters recentf smartparens smooth-scrolling solarized-theme spray vi-tilde-fringe volatile-highlights window-numbering zoom-frm)


;; For each package, define a function leo/init-<package-name>
;;
;; (defun leo/init-my-package ()
;;   "Initialize my package"
;;   )
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package

(defun leo/init-crontab-mode ()
  (use-package crontab-mode
    :init
    (add-to-list 'auto-mode-alist '("\\.cron\\(tab\\)?\\'" . crontab-mode)) ; *.cron, *.crontab
    (add-to-list 'auto-mode-alist '("cron\\(tab\\)?\\."    . crontab-mode)) ; *cron.*, *crontab.*
    ))

(defun leo/init-dumb-jump ()
  (use-package dumb-jump
    :config
    (dumb-jump-mode)
    ;; (setq dumb-jump-default-project "~")
    ))

;; (defun leo/init-tide ()
;;   (use-package tide
;;     :init
;;     (add-hook 'typescript-mode-hook
;;               (lambda ()
;;                 (evil-leader/set-key-for-mode 'typescript-mode
;;                   "mgg" 'tide-jump-to-definition
;;                   "mhh" 'tide-documentation-at-point
;;                   "mrr" 'tide-rename-symbol)
;;                 (tide-setup)
;;                 (flycheck-mode 1)
;;                 (eldoc-mode 1)))))

(setq leo/extensions/--this-file (or load-file-name buffer-file-name))
(defun leo/init-extensions ()
  (load (expand-file-name "./local/extensions/extensions.el" (file-name-directory leo/extensions/--this-file))))
;; Dependencies of extensions.el
(defun leo/init-thingatpt+ () (use-package thingatpt+))
(defun leo/init-string-inflection () (use-package string-inflection))
