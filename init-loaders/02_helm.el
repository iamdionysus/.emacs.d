;;; helm
;;
(require 'helm-config)
(setq helm-M-x-fuzzy-match t
      helm-buffers-fuzzy-matching t
      helm-recentf-fuzzy-matching t
      helm-split-window-in-side-p t
      helm-move-to-line-cycle-in-source t)

(global-set-key (kbd "C-x m") 'helm-mini)
(global-set-key (kbd "C-x b") 'helm-buffers-list)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x C-m") 'helm-M-x)
(global-set-key (kbd "C-x h") 'helm-apropos)
(global-set-key (kbd "C-x p") 'helm-projectile-find-file)
(global-set-key (kbd "C-x C-p") 'helm-projectile-switch-project)

;;; projectile
;;
(projectile-global-mode)
(setq projectile-completion-system 'helm)
(helm-projectile-on)
(setq projectile-indexing-method 'alien)

(global-set-key (kbd "C-x i") 'projectile-invalidate-cache)
(setq projectile-switch-project-action 'helm-projectile)

