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
        golden-ratio
        highlight-indentation
        highlight-numbers
        highlight-parentheses
        smartparens
        ))

;; List of packages to exclude.
(setq leo-excluded-packages '())

;;; FYI: list of packages included with spacemacs-minimal (builtins excluded):
;;
;; (async bind-key dash diminish elisp-slime-nav epl evil evil-escape evil-leader evil-surround evil-visualstar exec-path-from-shell fill-column-indicator goto-chg helm helm-core helm-descbinds helm-projectile ido-vertical-mode macrostep package-build page-break-lines pkg-info popup popwin projectile quelpa s spacemacs-theme undo-tree use-package which-key)

;; For each package, define a function leo/init-<package-name>
;;
;; (defun leo/init-my-package ()
;;   "Initialize my package"
;;   )
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package

(defun leo/init-golden-ratio ()
  (use-package golden-ratio
    :init
    (setq golden-ratio-auto-scale t)
    :config
    (golden-ratio-mode 1)))

(defun leo/init-highlight-indentation ()
  (use-package highlight-indentation
    :config
    (add-hook 'prog-mode-hook 'highlight-indentation-current-column-mode)))

(defun leo/init-highlight-numbers ()
  (use-package highlight-numbers
    :config
    (add-hook 'prog-mode-hook 'highlight-numbers-mode)))

(defun leo/init-highlight-parentheses ()
  (use-package highlight-parentheses
    :config
    (add-hook 'prog-mode-hook 'highlight-parentheses-mode)))

(defun leo/init-smartparens ()
  (use-package smartparens
    :ensure smartparens
    :config
    (progn
      (show-smartparens-global-mode t))
    (add-hook 'prog-mode-hook 'turn-on-smartparens-mode)
    (add-hook 'markdown-mode-hook 'turn-on-smartparens-mode)))
