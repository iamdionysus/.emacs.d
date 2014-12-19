(provide 'shortcuts)

;;; better deletion
;;
(global-set-key (kbd "C-w") 'backward-kill-word)
(global-set-key (kbd "C-x C-k") 'kill-region)

;;; manage window splits easily
;;
(global-set-key (kbd "C-x -") 'split-window-below)
(global-set-key (kbd "C-x \\") 'split-window-right)
(global-set-key (kbd "C-M-o") 'other-window)
(global-set-key (kbd "C-M-k") 'shrink-window-horizontally)
(global-set-key (kbd "C-M-l") 'enlarge-window-horizontally)
(global-set-key (kbd "C-M-u") 'enlarge-window)
(global-set-key (kbd "C-M-y") 'shrink-window)

;;; load-file
;;
(global-set-key (kbd "C-x C-l") 'load-file)

;;; smex
;;
(global-set-key (kbd "C-x C-m") 'smex)

;;; helm
;;
(global-set-key (kbd "C-x m") 'helm-mini)
(global-set-key (kbd "C-x C-d") 'helm-find-files)

;;; multi-term
;;
(global-set-key (kbd "C-M-t") 'multi-term)
(global-set-key (kbd "C-x .") 'multi-term-next)
(global-set-key (kbd "C-x ,") 'multi-term-prev)
(global-set-key (kbd "C-c C-k") 'term-char-mode)
(global-set-key (kbd "C-c C-l") 'term-line-mode)

;;; projectile
;;
(projectile-global-mode)
(global-set-key (kbd "C-x p") 'projectile-find-file)


