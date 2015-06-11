;;; better deletion
;;
(global-set-key (kbd "C-w") 'backward-kill-word)
(global-set-key (kbd "C-x C-k") 'kill-region)

;;; manage window splits easily
;;
(global-set-key (kbd "C-x [") 'previous-buffer)
(global-set-key (kbd "C-x ]") 'next-buffer)
(global-set-key (kbd "C-x -") 'split-window-below)
(global-set-key (kbd "C-x \\") 'split-window-right)
(global-set-key (kbd "C-M-o") 'other-window)
(global-set-key (kbd "C-x <left>") 'windmove-left)
(global-set-key (kbd "C-x <right>") 'windmove-right)
(global-set-key (kbd "C-x <up>") 'windmove-up)
(global-set-key (kbd "C-x <down>") 'windmove-down)
(global-set-key (kbd "C-x C-<left>") 'windmove-left)
(global-set-key (kbd "C-x C-<right>") 'windmove-right)
(global-set-key (kbd "C-x C-<up>") 'windmove-up)
(global-set-key (kbd "C-x C-<down>") 'windmove-down)
(global-set-key (kbd "C-M-k") 'shrink-window-horizontally)
(global-set-key (kbd "C-M-l") 'enlarge-window-horizontally)
(global-set-key (kbd "C-M-u") 'enlarge-window)
(global-set-key (kbd "C-M-y") 'shrink-window)

;;; load-bookmarklist
;;
(global-set-key (kbd "C-x C-l") 'bookmark-bmenu-list)

;;; eval-last-sexp
;;
(global-set-key (kbd "C-x e") 'eval-last-sexp)
