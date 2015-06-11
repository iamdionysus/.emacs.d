;;; helm
;;
(require 'helm-config)
(setq helm-M-x-fuzzy-match t)
(global-set-key (kbd "C-x m") 'helm-mini)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x C-m") 'helm-M-x)
(global-set-key (kbd "C-x h") 'helm-apropos)
		
;;; projectile
;;
(projectile-global-mode)
(setq projectile-completion-system 'helm)
(helm-projectile-on)
(setq projectile-indexing-method 'alien)
(global-set-key (kbd "C-x p") 'helm-projectile-find-file)
(global-set-key (kbd "C-x i") 'projectile-invalidate-cache)
;; (setq projectile-switch-project-action 'helm-projectile)

