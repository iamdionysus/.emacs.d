(use-package org
  :ensure t
  :defer t
  :init
  (setq org-src-fontify-natively t)
  (setq org-log-done 'time)
  (setq org-return-follows-link t))

;; (eval-after-load 'org
;;   '(progn
;;      (define-key org-mode-map (kbd "C-M-n") 'outline-next-visible-heading)
;;      (define-key org-mode-map (kbd "C-M-p") 'outline-previous-heading)
;;      (define-key org-mode-map (kbd "C-c C-x C-k") 'org-cut-special)))
