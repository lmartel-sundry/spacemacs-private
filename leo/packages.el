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

;; (defun leo/init-aggressive-indent ()
;;   (use-package aggressive-indent
;;     :init
;;     (add-hook 'emacs-lisp-mode-hook 'aggressive-indent-mode)))

;; (defun leo/init-clean-aindent-mode ()
;;   (use-package clean-aindent-mode
;;     :init
;;     (add-hook 'prog-mode-hook 'clean-aindent-mode)))

;; (defun leo/init-highlight-indentation ()
;;   (use-package highlight-indentation
;;     :init
;;     (add-hook 'prog-mode-hook 'highlight-indentation-current-column-mode)))

;; (defun leo/init-highlight-parentheses ()
;;   (use-package highlight-parentheses
;;     :init
;;     (add-hook 'prog-mode-hook 'highlight-parentheses-mode)))

;; (defun leo/init-smartparens ()
;;   (use-package smartparens
;;     :ensure smartparens
;;     :config
;;     (progn
;;       (show-smartparens-global-mode t))
;;     (add-hook 'prog-mode-hook 'turn-on-smartparens-mode)
;;     (add-hook 'markdown-mode-hook 'turn-on-smartparens-mode)))
