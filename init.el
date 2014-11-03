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


;;; Commonn-lisp compatibility
;;
(with-no-warnings
  (require 'cl))

;;; require use-package
;;
(require 'use-package)

;;; Look and feel
;;

(menu-bar-mode -1) ;; no menu bar

(setq compilation-scroll-output t)  ;; automatically go to bottom of the compilation buffer
(setq make-backup-files nil) ;; no backup file ~


;;; buffer-move
;;
(use-package buffer-move
  :bind(
	("C-c <up>" . buf-move-up)
	("C-c <down>" . buf-move-down)
	("C-c <left>" . buf-move-left)
	("C-c <right>" . buf-move-right)
	)
  :ensure t
)

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

;;; dired moving to parent directory without opening a new buffer
;;
(put 'dired-find-alternate-file 'disabled nil)
(add-hook 'dired-mode-hook
 (lambda ()
  (define-key dired-mode-map (kbd "^")
    (lambda () (interactive) (find-alternate-file "..")))
  ; was dired-up-directory
))


;;; solarized-dark
;;
(use-package color-theme-solarized
  :defer t
  :init
  (load-theme 'solarized-dark t)
  :ensure t
)

;;; smex
;;
(use-package smex
  :bind (("C-x C-m" . smex))
  :ensure t
)


;;; multi-term
;;
(use-package multi-term
  :if (not window-system)
  :bind (("C-M-t" . multi-term))
  :ensure t
)

;;; magit
;;
(use-package magit
  :bind ("C-x g" . magit-status)
  :ensure t
)

;;; ruby settings: inf-ruby
;;
(defun inf-ruby-and-load-file()
  "execute command inf-ruby and ruby-load-file"
  (interactive)
  (let (file-name-from)
    (setq file-name-from buffer-file-name)
    (save-buffer)
    (inf-ruby)
    (ruby-load-file file-name-from)
  )
)

(defun toggle-breakpoint()
  "toggle breakpoint via binding.pry"
  (interactive)
  (beginning-of-line)
  (insert "binding.pry")
  (newline)
)

(defun delete-all-breakpoint()
  "delete all breakpoint  as binding.pry"
  (interactive)
  (let (pos-from)
    (setq pos-from (point))
    (beginning-of-buffer)
    (delete-matching-lines "binding.pry")
    (goto-char pos-from)
  )
)

(use-package inf-ruby
  :bind(
    ("<f2>" . inf-ruby)
    ("<f5>" . inf-ruby-and-load-file)
    ("<f6>" . ruby-save-compile-this-buffer)
    ("<f9>" . toggle-breakpoint)
    ("<f10>" . delete-all-breakpoint)
;;    ("C-\\" . ruby-send-last-sexp)
  )
  :ensure t
)  

;;; ruby settings: rinari
(use-package rinari
  :ensure t
)  

;;; ruby settings: robe
;;
(use-package robe
  :init (add-hook 'ruby-mode-hook 'robe-mode)
  :ensure t
)
  

;;; ruby compile/run/debug settings
;;

;;; minitest mode for emacs
;;
(use-package minitest
  :ensure t
)

;;; helm
;;
(use-package helm
  :bind (
    ("C-x m" . helm-mini)
    ("C-x f" . helm-projectile)
    ("C-x C-d" . helm-find-files))
  :ensure t
)

;;; helm-projectile
;;
(use-package helm-projectile
  :ensure t
)

;;; projectile
;;
(use-package projectile
  :init
  (progn
    (projectile-global-mode)
  )
  :bind (("C-x p" . projectile-find-file))
  :ensure t
)


;;; company-mode
;;
(use-package company
  :init
  (progn
      (add-hook 'after-init-hook 'global-company-mode)
      (eval-after-load 'company
	'(add-to-list 'company-backends 'company-inf-ruby))
      (eval-after-load 'company
	'(push 'company-robe company-backends)))
  :bind
  (("M-SPC" . company-complete-common))
  :ensure t)


;;; web-mode
;;
(use-package web-mode
  :init
  (progn
    (add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
    (add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
    (add-to-list 'auto-mode-alist '("\\.[gj]sp\\'" . web-mode))
    (add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
    (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
    (add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
    (add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
  )
  :ensure t
)

;;; emmet-mode
;;
(use-package emmet-mode
  :init
  (progn
    (add-hook 'html-mode-hook 'emmet-mode)
    (add-hook 'web-mode-hook 'emmet-mode))
  :ensure t
)

;;; flx-ido
;;
(use-package flx-ido
  :init
  (progn
    (require 'flx-ido)
    (ido-mode t)
    (ido-everywhere t)
    (flx-ido-mode t)
    (setq ido-enable-flex-matching t)
    (setq ido-use-faces nil)
  )
  :ensure t
)


;;; markdown-mode
;;
(use-package markdown-mode
  :ensure t
)

;;; yaml-mode
;;
(use-package yaml-mode
  :ensure t
)



;;; setups for windows
;;
(when window-system
  (tool-bar-mode -1) ;; no tool bar
  (add-to-list 'initial-frame-alist '(height . 50))
  (add-to-list 'initial-frame-alist '(width . 180))
  (add-to-list 'initial-frame-alist '(left . 0))
  (add-to-list 'initial-frame-alist '(top . 50))
  (set-language-environment "UTF-8")
  (set-face-attribute 'default nil :font "Consolas-12")
  (add-to-list 'exec-path "C:/Program Files (x86)/Aspell/bin/")
  (setq ispell-program-name "aspell")
  (setq ispell-personal-dictionary "C:/Program Files (x86)/Aspell/dict")
)

;;; haskell-mode settings
;; (add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
;; ;; (add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
;; (add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)

;; (setq haskell-hoogle-command "hoogle")

;; (defun haskell-process-load-and-jump()
;;   "run haskell-process-load-or-reload and move to other window"
;;   (interactive)
;;   (haskell-process-load-or-reload)
;;   (other-window 1)
;; )

;; (defun haskell-mode-keys()
;;   "key map for haskell-mode"
;;   (local-set-key (kbd "<f5>") 'haskell-process-load-and-jump)
;;   (local-set-key (kbd "<f6>") 'flycheck-buffer-and-list-errors)
;; )
;; (add-hook 'haskell-mode-hook 'haskell-mode-keys)


;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("e16a771a13a202ee6e276d06098bc77f008b73bbac4d526f160faa2d76c1dd0e" "3b819bba57a676edf6e4881bd38c777f96d1aa3b3b5bc21d8266fa5b0d0f1ebf" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
