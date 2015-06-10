;;; init.el --- sets my style

;;; Commentary:
;;
;; this file is to set up my own Emacs environment
;; both linux and windows
;; recently started to use use-package to install package automatically

;;; Code:


(require 'cask "/usr/local/share/emacs/site-lisp/cask.el")
(cask-initialize)

;; (require 'benchmark-init)

;;; Commonn-lisp compatibility
;;
(with-no-warnings
  (require 'cl))

;;; personal settings
;;
(load-theme 'wombat)
(split-window-right)
(setq create-lockfiles nil) ;; solve broccoli issue which bothers ember-cli
(setq auto-save-visited-file-name t)
(setq backup-directory-alist
      '(("" . "~/.emacs.d/emacs-backup")))
(add-to-list 'load-path "~/.emacs.d/config")
(require 'my-shortcuts)
(require 'my-look-and-feel)


;;; package settings
;;
;; (require 'my-ruby)

(if (eq system-type 'windows-nt)
    (setq w32-get-true-file-attributes nil))

;; (unless (eq system-type 'windows-nt)
;;   (require 'my-ocaml))

;;; flycheck
;;
;; (add-hook 'after-init-hook #'global-flycheck-mode)

;;; electric-pair-mode
;;
(electric-pair-mode t)
(show-paren-mode t)
(setq blink-matching-paren nil)

;;; flx-ido
;;
(require 'flx-ido)
(ido-mode t)
(ido-everywhere t)
(flx-ido-mode t)
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)

;;; recentf
;;
(recentf-mode t)
(setq recentf-max-menu-items 50)


;;; projectile
;;
(projectile-global-mode)
(setq projectile-indexing-method 'alien)

;;; org
;;
(setq org-src-fontify-natively t)
(setq org-log-done 'time)
(setq org-return-follows-link t)

;;; company-mode
;;
;; (eval-after-load 'company
;; 	'(add-to-list 'company-backends 'company-inf-ruby))
(add-hook 'after-init-hook 'global-company-mode)
(eval-after-load 'company '(push 'company-robe company-backends))

;;; js-mode
;;
(setq js-indent-level 2)

;;; web-mode
;;
(add-to-list 'auto-mode-alist '("\\.hbs\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.[gj]sp\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
;; (setq web-mode-comment-style 2)
;; (setq web-mode-engines-alist
;; 	  '(("ctemplate" . "\\.hbs\\'")
;; 	    ("erb" . "\\.erb\\'"))

(defun my-web-mode-hook ()
  "Hooks for web mode."
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2))
(add-hook 'web-mode-hook 'my-web-mode-hook)

;;; emmet-mode
;;
(add-hook 'html-mode-hook 'emmet-mode)
(add-hook 'web-mode-hook 'emmet-mode)

;;; coffee-mode
;;
(custom-set-variables '(coffee-tab-width 2))

(setq inhibit-startup-screen t)
;;; init.el ends here

