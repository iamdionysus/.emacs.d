(use-package rinari
  :commands ruby-mode
  :ensure t
  :config
  (add-hook 'ruby-mode-hook 'rinari-minor-mode)
  (define-key rinari-minor-mode-map (kbd "C-c m") 'rinari-find-model)
  (define-key rinari-minor-mode-map (kbd "C-c f") 'rinari-find-fixture)
  (define-key rinari-minor-mode-map (kbd "C-c c") 'rinari-find-controller)
  (define-key rinari-minor-mode-map (kbd "C-c r") 'rinari-find-routes)
  (define-key rinari-minor-mode-map (kbd "C-c g") 'rinari-find-migration)
  (define-key rinari-minor-mode-map (kbd "C-c t") 'rinari-find-test))

(use-package ruby-tools
  :ensure t)

(use-package rspec-mode
  :ensure t)

;; (eval-after-load 'rinari
;;   '(progn
;; ))


;; ("<f2>" . inf-ruby)
;; ("<f5>" . inf-ruby-and-load-file)
;; ;; ("<f6>" . ruby-save-compile-this-buffer)
;; ("<f9>" . toggle-breakpoint)
;; ("<f10>" . delete-all-breakpoint)
;; ("C-\\" . ruby-send-last-sexp)
