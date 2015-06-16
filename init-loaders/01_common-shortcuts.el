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


;;; easy lisp
;;
(global-set-key (kbd "C-x e") 'eval-last-sexp)

;;; select all
;;
;; (global-set-key (kbd "C-x C-x") 'mark-whole-buffer)

;;; move line up and down
;;
(defun move-line-up ()
  (interactive)
  (transpose-lines 1)
  (forward-line -2))

(defun move-line-down ()
  (interactive)
  (forward-line 1)
  (transpose-lines 1)
  (forward-line -1))

(global-set-key (kbd "M-p") 'move-line-up)
(global-set-key (kbd "M-n") 'move-line-down)
