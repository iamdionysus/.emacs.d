
(use-package powerline
  :ensure t
  :config (powerline-default-theme))

(use-package rainbow-delimiters
  :ensure t
  :config (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

(use-package monokai-theme
  :ensure t
  :config
  (load-theme 'monokai t))

;; (indent-guide-global-mode)
