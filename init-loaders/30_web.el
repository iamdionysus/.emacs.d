;;; web-mode
;;
(defun web-mode-inside-next-element()
  "move to next html element and select element content"
  (interactive)
  (web-mode-element-end)
  (web-mode-element-next)
  (web-mode-element-content-select))

(defun web-mode-inside-previous-element()
  "move to next html element and select element content"
  (interactive)
  (web-mode-element-beginning)
  (web-mode-element-previous)
  (web-mode-element-content-select))

(eval-after-load 'web-mode
  '(progn
     (define-key web-mode-map (kbd "C-M-n") 'web-mode-inside-next-element)
     (define-key web-mode-map (kbd "C-M-p") 'web-mode-inside-previous-element)))

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
