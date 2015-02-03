(provide 'my-ruby)

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
;;
(use-package rinari
  :init (add-hook 'ruby-mode-hook 'rinari-minor-mode)
  ;; :bind(
  ;; 	("C-c m" . rinari-find-model)
  ;; 	("C-c f" . rinari-find-fixture)
  ;; 	("C-c c" . rinari-find-controller)
  ;; 	("C-c r" . rinari-find-routes)
  ;; 	("C-c g" . rinari-find-migration)
  ;; 	("C-c t" . rinari-find-test)
  ;; 	)
  :ensure t)  

;;; ruby settings: robe
;;
(use-package robe
  :init
  (progn
    (add-hook 'ruby-mode-hook 'robe-mode)
    (define-key rinari-minor-mode-map (kbd "C-c m") 'rinari-find-model)
    (define-key rinari-minor-mode-map (kbd "C-c f") 'rinari-find-fixture)
    (define-key rinari-minor-mode-map (kbd "C-c c") 'rinari-find-controller)
    (define-key rinari-minor-mode-map (kbd "C-c r") 'rinari-find-routes)
    (define-key rinari-minor-mode-map (kbd "C-c g") 'rinari-find-migration)
    (define-key rinari-minor-mode-map (kbd "C-c t") 'rinari-find-test))
  :ensure t)
