;;; init.el --- sets my style

;;; Commentary:
;;
;; this file is to set up my own Emacs environment
;; both linux and windows
;; recently started to use use-package to install package automatically

;;; Code:



;;; MELPA settgins
;;
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)
;; (require 'benchmark-init)

;;; Commonn-lisp compatibility
;;
(with-no-warnings
  (require 'cl))

;;; personal settings
;;
(setq create-lockfiles nil) ;; solve broccoli issue which bothers ember-cli
(setq auto-save-visited-file-name t)
(setq backup-directory-alist
      '(("" . "~/.emacs.d/emacs-backup")))

(add-to-list 'load-path "~/.emacs.d/config")
(require 'my-shortcuts)
(require 'my-look-and-feel)

;;; require use-package
;;
(require 'use-package)

;;; package settings
;;
(require 'my-util)
(require 'my-dev)
(require 'my-ruby)
;; (unless (eq system-type 'windows-nt)
;;   (require 'my-ocaml))

;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files
   (quote
    ("c:/Users/Administrator/Dropbox/document/org/tasks.org"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
