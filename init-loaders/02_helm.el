;;; helm
;;
(require 'helm-config)


;;; projectile
;;
(projectile-global-mode)
(setq projectile-completion-system 'helm)
(helm-projectile-on)
(setq projectile-indexing-method 'alien)
(global-set-key (kbd "C-x p") 'helm-projectile-find-file)
(global-set-key (kbd "C-x i") 'projectile-invalidate-cache)
;; (setq projectile-switch-project-action 'helm-projectile)

