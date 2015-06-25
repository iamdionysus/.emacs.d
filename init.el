;;; init.el --- sets my style

;;; Commentary:
;;
;; this file is to set up my own Emacs environment
;; both linux and windows
;; recently started to use use-package to install package automatically

;;; Code:

(if (eq system-type 'darwin)
    (require 'cask "/usr/local/share/emacs/site-lisp/cask.el")
  (require 'cask "~/.cask/cask.el"))
(cask-initialize)

(require 'init-loader)
(custom-set-variables '(init-loader-show-log-after-init 'error-only))
(init-loader-load "~/.emacs.d/init-loaders")

;;; init.el ends here
