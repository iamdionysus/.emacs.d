(provide 'my-util)


;;; buffer-move
;;
(use-package buffer-move
  :bind(
	("C-c <up>" . buf-move-up)
	("C-c <down>" . buf-move-down)
	("C-c <left>" . buf-move-left)
	("C-c <right>" . buf-move-right)
	)
  :ensure t)


;;; dired moving to parent directory without opening a new buffer
;;
;; (put 'dired-find-alternate-file 'disabled nil)
;; (add-hook 'dired-mode-hook
;;  (lambda ()
;;   (define-key dired-mode-map (kbd "^")
;;     (lambda () (interactive) (find-alternate-file "..")))
;;   ; was dired-up-directory
;; ))


;;; smex
;;
(use-package smex
  :ensure t)


;;; multi-term
;;
(use-package multi-term
  :ensure t)


;;; projectile
;;
(use-package projectile
  :init
  (progn
    (projectile-global-mode)
    (setq projectile-indexing-method 'alien))
  :ensure t)


;;; recentf
;;
(recentf-mode t)
(setq recentf-max-menu-items 50)


;;; electric-pair-mode
;;
(electric-pair-mode t)
(show-paren-mode t)
(setq blink-matching-paren nil)


;;; flx-ido
;;
(use-package flx-ido
  :config
  (progn
    (require 'flx-ido)
    (ido-mode t)
    (ido-everywhere t)
    (flx-ido-mode t)
    (setq ido-enable-flex-matching t)
    (setq ido-use-faces nil))
  :ensure t)

;;; ag
(use-package ag
  :ensure t)
