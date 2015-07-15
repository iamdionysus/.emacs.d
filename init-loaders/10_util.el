;;; flycheck
;;
;; (add-hook 'after-init-hook #'global-flycheck-mode)

(use-package multiple-cursors
  :ensure t
  :bind (("C-." . mc/mark-next-like-this)
	 ("C-," . mc/mark-previous-like-this)
	 ("C-c C-." . mc/mark-all-like-this)))

(use-package company
  :ensure t
  :config (global-company-mode t)
  :bind ("M-SPC" . company-complete-common))
;; (add-hook 'after-init-hook 'global-company-mode)
;; (global-set-key (kbd "M-SPC") 'company-complete-common)
;; (eval-after-load 'company '(push 'company-robe company-backends))
;; (eval-after-load 'company
;; 	'(add-to-list 'company-backends 'company-inf-ruby))

(use-package evil-nerd-commenter
  :ensure t
  :config
  (defun comment-or-uncomment-line-and-forward-line()
  "evilnc-comment-or-uncomment-lines and move to next-line"
  (interactive)
  (evilnc-comment-or-uncomment-lines 1)
  (forward-line)
  (beginning-of-line))
  :bind (("M-;" . comment-or-uncomment-line-and-forward-line)
	 ("C-c C-k" . comment-or-uncomment-line-and-forward-line)
	 ("C-M-;" . evilnc-comment-or-uncomment-paragraphs)))

(use-package magit
  :ensure t
  :bind (("C-x g" . magit-dispatch-popup)
	 ("C-x s" . magit-status)))

(use-package swiper
  :ensure t
  :bind (("C-s" . swiper)
	 ("C-r" . swiper)
	 ("C-c C-r" . ivy-resume)))
