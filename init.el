;;; init.el --- sets my style

;;; Commentary:
;;
;; this file is to set up my own Emacs environment
;; both linux and windows
;; recently started to use use-package to install package automatically

;;; Code:


;;; Commonn-lisp compatibility
;;
(with-no-warnings (require 'cl))

(setq make-backup-files nil) ;; no backup file ~

;;; el-get settings
;;
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(add-to-list 'el-get-recipe-path "~/.emacs.d/recipes")
(setq el-get-verbose t)

;;; my package list goes here, group it
;;
(setq gabriel-packages
      (append
       '(smex multi-term
	 smartparens
	 web-mode emmet-mode sass-mode markdown-mode yaml-mode
	 org-mode
	 company-mode company-inf-ruby
	 helm projectile flx
	 inf-ruby)))

(el-get 'sync gabriel-packages)

;;; custom settings
;;
(add-to-list 'load-path "~/.emacs.d/config")
(require 'shortcuts)
(require 'look-and-feel)
