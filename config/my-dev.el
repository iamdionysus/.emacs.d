(provide 'my-dev)

;;; org
;;
(use-package org
  :init
  (progn
    (setq org-tag-alist '(("WORK" . ?w) ("HOME" . ?h)))
    (setq org-src-fontify-natively t))
  :ensure t)

;;; web-mode
;;
(use-package web-mode
  :init
  (progn
    ;; (add-to-list 'auto-mode-alist '("\\.hbs\\'" . web-mode))    
    ;; (add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
    ;; (add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
    ;; (add-to-list 'auto-mode-alist '("\\.[gj]sp\\'" . web-mode))
    ;; (add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
    (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
    ;; (add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
    ;; (add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
    (setq web-mode-comment-style 2)
    ;; (setq web-mode-engines-alist
    ;; 	  '(("ctemplate" . "\\.hbs\\'")
    ;; 	    ("erb" . "\\.erb\\'"))
    ;; )
  )
  :ensure t)

;;; sass-mode
;;
(use-package sass-mode
  :ensure t)

;;; emmet-mode
;;
(use-package emmet-mode
  :init
  (progn
    (add-hook 'html-mode-hook 'emmet-mode)
    (add-hook 'web-mode-hook 'emmet-mode)
  )
  :ensure t)

;;; markdown-mode
;;
(use-package markdown-mode
  :ensure t)

;;; yaml-mode
;;
(use-package yaml-mode
  :ensure t)

;;; coffee script
;;
(use-package coffee-mode
  :ensure t
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
