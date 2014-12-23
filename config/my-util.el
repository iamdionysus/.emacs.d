(provide 'my-util)

;;; solarized-dark
;;
(use-package color-theme-solarized
  :if (window-system)
  :defer t
  :init
  (load-theme 'solarized-dark t)
  :ensure t
)


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


;;; dired moving to parent directory without opening a new buffer
;;
(put 'dired-find-alternate-file 'disabled nil)
(add-hook 'dired-mode-hook
 (lambda ()
  (define-key dired-mode-map (kbd "^")
    (lambda () (interactive) (find-alternate-file "..")))
  ; was dired-up-directory
))


;;; smex
;;
(use-package smex
  :bind (("C-x C-m" . smex))
  :ensure t
)


;;; multi-term
;;
(use-package multi-term
  :if (not window-system)  ;; needs to fix this later
  :bind (
	 ("C-M-t" . multi-term)
	 ("C-x ." . multi-term-next)
	 ("C-x ," . multi-term-prev)
	 ("C-c C-k" . term-char-mode)
	 ("C-c C-l" . term-line-mode)
	 )
  :ensure t
)


;;; projectile
;;
(use-package projectile
  :init
  (progn
    (projectile-global-mode)
    (setq projectile-indexing-method 'alien)
  )
  :bind (("C-x p" . projectile-find-file))
  :ensure t
)


;;; recentf
;;
(recentf-mode t)
(global-set-key (kbd "C-x m") 'recentf-open-files)


;;; electric-pair-mode
;;
(electric-pair-mode t)
(setq blink-matching-paren nil)

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
