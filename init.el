;;; init.el --- sets my style

;;; Commentary:
;;
;; this file is to set up my own Emacs environment
;; both linux and windows
;; recently started to use use-package to install package automatically

;;; Code:


;;; Commonn-lisp compatibility
;;
(with-no-warnings
  (require 'cl))

;;; Look and feel
;;

(menu-bar-mode -1) ;; no menu bar
(setq compilation-scroll-output t)  ;; automatically go to bottom of the compilation buffer
(setq make-backup-files nil) ;; no backup file ~
(column-number-mode t)

;;; better deletion
;;
(global-set-key (kbd "C-w") 'backward-kill-word)
(global-set-key (kbd "C-x C-k") 'kill-region)

;;; manage window splits easily
;;
(global-set-key (kbd "C-x -") 'split-window-below)
(global-set-key (kbd "C-x \\") 'split-window-right)
(global-set-key (kbd "C-M-o") 'other-window)
(global-set-key (kbd "C-M-k") 'shrink-window-horizontally)
(global-set-key (kbd "C-M-l") 'enlarge-window-horizontally)
(global-set-key (kbd "C-M-u") 'enlarge-window)
(global-set-key (kbd "C-M-y") 'shrink-window)

;;; load-file
;;
(global-set-key (kbd "C-x C-l") 'load-file)

;;; el-get settings
;;
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (require 'package)
  (add-to-list 'package-archives
	       '("melpa" . "http://melpa.org/packages/"))
  (package-refresh-contents)
  (package-initialize)
  (package-install 'el-get)
  (require 'el-get))

(add-to-list 'el-get-recipe-path "~/.emacs.d/recipes/")
(setq el-get-verbose t)

;; my package list goes here, group close ones
(setq gabriel-packages
      (append
       '(smex multi-term
	 smartparens
	 web-mode
	 company-mode company-inf-ruby
	 helm projectile)))

(el-get 'sync gabriel-packages)
