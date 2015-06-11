;;; flycheck
;;
;; (add-hook 'after-init-hook #'global-flycheck-mode)

;;; flx-ido
;;
;; (require 'flx-ido)
;; (ido-mode t)
;; (ido-everywhere t)
;; (flx-ido-mode t)
;; (setq ido-enable-flex-matching t)
;; (setq ido-use-faces nil)


;;; smex
;;
;; (global-set-key (kbd "C-x C-m") 'smex)



;;; company
;;
(add-hook 'after-init-hook 'global-company-mode)
(global-set-key (kbd "M-SPC") 'company-complete-common)
;; (eval-after-load 'company '(push 'company-robe company-backends))
;; (eval-after-load 'company
;; 	'(add-to-list 'company-backends 'company-inf-ruby))


;;; org
;;
(eval-after-load 'org
  '(progn
     (define-key org-mode-map (kbd "C-M-n") 'outline-next-visible-heading)
     (define-key org-mode-map (kbd "C-M-p") 'outline-previous-heading)
     (define-key org-mode-map (kbd "C-c C-x C-k") 'org-cut-special)))
(setq org-src-fontify-natively t)
(setq org-log-done 'time)
(setq org-return-follows-link t)

;;; evilnc-nerd-commenter
;;
(defun comment-or-uncomment-line-and-forward-line()
    "evilnc-comment-or-uncomment-lines and move to next-line"
  (interactive)
  (evilnc-comment-or-uncomment-lines 1)
  (forward-line)
  (beginning-of-line))

(global-set-key (kbd "M-;") 'comment-or-uncomment-line-and-forward-line)
;; (global-set-key (kbd "M-;") 'evilnc-comment-or-uncomment-lines)
(global-set-key (kbd "C-M-;") 'evilnc-comment-or-uncomment-paragraphs)

