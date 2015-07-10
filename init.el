;;; init.el --- sets my style

;;; Commentary:
;;
;; this file is to set up my own Emacs environment
;; both linux and windows
;; recently started to use use-package to install package automatically

;;; Code:

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(package-initialize)

(eval-when-compile
  (require 'use-package))

(require 'init-loader)
(custom-set-variables
 '(init-loader-show-log-after-init (quote error-only))
 '(magit-commit-arguments (quote ("--all"))))
(init-loader-load "~/.emacs.d/init-loaders")


;;; init.el ends here
