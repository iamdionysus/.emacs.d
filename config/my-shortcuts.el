(provide 'my-shortcuts)

;;; better deletion
;;
(global-set-key (kbd "C-w") 'backward-kill-word)
(global-set-key (kbd "C-x C-k") 'kill-region)

;;; manage window splits easily
;;
(global-set-key (kbd "C-x -") 'split-window-below)
(global-set-key (kbd "C-x \\") 'split-window-right)
(global-set-key (kbd "C-M-o") 'other-window)
(global-set-key (kbd "C-<left>") 'windmove-left)
(global-set-key (kbd "C-<right>") 'windmove-right)
(global-set-key (kbd "C-<up>") 'windmove-up)
(global-set-key (kbd "C-<down>") 'windmove-down)
(global-set-key (kbd "C-M-k") 'shrink-window-horizontally)
(global-set-key (kbd "C-M-l") 'enlarge-window-horizontally)
(global-set-key (kbd "C-M-u") 'enlarge-window)
(global-set-key (kbd "C-M-y") 'shrink-window)

;;; load-bookmarklist
;;
(global-set-key (kbd "C-x C-l") 'bookmark-bmenu-list)
(global-set-key (kbd "C-x C-j") 'bookmark-jump)

;;; my-util
;;
(global-set-key (kbd "C-x C-m") 'smex)
(global-set-key (kbd "C-x p") 'projectile-find-file)
(global-set-key (kbd "C-x m") 'recentf-open-files)
(if (window-system)
    (progn
      (global-set-key (kbd "C-M-t") 'eshell))
  (progn
    (global-set-key (kbd "C-M-t") 'multi-term)
    (global-set-key (kbd "C-x .") 'multi-term-next)
    (global-set-key (kbd "C-x ,") 'multi-term-prev)
    (global-set-key (kbd "C-c C-k") 'term-char-mode)
    (global-set-key (kbd "C-c C-l") 'term-line-mode)))



;;; my-dev
;;
(global-set-key (kbd "M-SPC") 'company-complete-common)
(eval-after-load 'org
  '(progn
     (define-key org-mode-map (kbd "C-M-n") 'outline-next-visible-heading)
     (define-key org-mode-map (kbd "C-M-p") 'outline-previous-heading)
     (define-key org-mode-map (kbd "C-c C-x C-k") 'org-cut-special)))

;;; my-ruby
;;
(eval-after-load 'rinari
  '(progn
    (add-hook 'ruby-mode-hook 'rinari-minor-mode)
    (define-key rinari-minor-mode-map (kbd "C-c m") 'rinari-find-model)
    (define-key rinari-minor-mode-map (kbd "C-c f") 'rinari-find-fixture)
    (define-key rinari-minor-mode-map (kbd "C-c c") 'rinari-find-controller)
    (define-key rinari-minor-mode-map (kbd "C-c r") 'rinari-find-routes)
    (define-key rinari-minor-mode-map (kbd "C-c g") 'rinari-find-migration)
    (define-key rinari-minor-mode-map (kbd "C-c t") 'rinari-find-test)))
