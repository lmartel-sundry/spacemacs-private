;;; packages.el --- fireplace Layer packages File for Spacemacs
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
(setq fireplace-packages
    '(
      ;; package names go here
      (emacs-fireplace :location local)
      ))

;; List of packages to exclude.
(setq fireplace-excluded-packages '())

;; For each package, define a function fireplace/init-<package-name>
;;
;; (defun fireplace/init-my-package ()
;;   "Initialize my package"
;;   )
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package

(setq fireplace/--this-file (or load-file-name buffer-file-name))
(defun fireplace/init-emacs-fireplace ()
  (load (expand-file-name "./local/emacs-fireplace/fireplace.el" (file-name-directory fireplace/--this-file))))
