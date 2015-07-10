;;; web-mode
;;
(use-package web-mode
  :ensure t
  :mode ("\\.hbs\\'" "\\.erb\\'" "\\.html?\\'")
  :init
  (defun my-web-mode-hook ()
      "Hooks for web mode"
      (setq web-mode-markup-indent-offset 2)
      (setq web-mode-css-indent-offset 2)
      (setq web-mode-code-indent-offset 2)
      (setq web-mode-enable-css-colorization t))
  (add-hook 'web-mode-hook 'my-web-mode-hook)
  :config
  (defun web-mode-inside-next-element ()
    "move to next html element and select element content"
    (interactive)
    (web-mode-element-end)
    (web-mode-element-next)
    (web-mode-element-content-select))
  (defun web-mode-inside-previous-element ()
    "move to next html element and select element content"
    (interactive)
    (web-mode-element-beginning)
    (web-mode-element-previous)
    (web-mode-element-content-select))
  (define-key web-mode-map (kbd "C-M-n") 'web-mode-inside-next-element)
  (define-key web-mode-map (kbd "C-M-p") 'web-mode-inside-previous-element))

;;; emmet-mode
;;
(use-package emmet-mode
  :ensure t
  :init
  (add-hook 'web-mode-hook 'emmet-mode))

;;; js-mode
;;
(setq js-indent-level 2)


;;; coffee-mode
;;
(custom-set-variables '(coffee-tab-width 2))

;;; markdown
;;
(use-package markdown-mode
  :ensure t)
