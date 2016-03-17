;;; packages.el --- asana Layer packages File for Spacemacs
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
(setq asana-packages
    '(
      ;; package names go here
	exec-path-from-shell
      ))

;; List of packages to exclude.
(setq asana-excluded-packages '())

;; For each package, define a function asana/init-<package-name>
;;
;; (defun asana/init-my-package ()
;;   "Initialize my package"
;;   )
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package

(defun spacemacs-base/init-exec-path-from-shell ()
  (use-package exec-path-from-shell
    :init (when (memq window-system '(mac ns x))
            (exec-path-from-shell-initialize))))

(defun asana/post-init-exec-path-from-shell ()
  (load "~/.emacs.d/private/asana/emacs-asana/asana.el")
  (global-asana-mode 1))
