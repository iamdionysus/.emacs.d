;;; helm
;;
(require 'helm)
(require 'helm-config)
(setq helm-M-x-fuzzy-match t)
(setq helm-buffers-fuzzy-matching t)
(setq helm-recentf-fuzzy-matching t)
(setq helm-split-window-in-side-p t)

(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action)
(global-set-key (kbd "C-x m") 'helm-mini)
(global-set-key (kbd "C-x b") 'helm-buffers-list)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x C-m") 'helm-M-x)
(global-set-key (kbd "C-x C-h") 'helm-apropos)
(global-set-key (kbd "C-x p") 'helm-projectile-find-file)
(global-set-key (kbd "C-x C-p") 'helm-projectile-switch-project)
(global-set-key (kbd "C-x f") 'helm-occur)

;;; projectile
;;
(projectile-global-mode)
(setq projectile-file-exists-remote-cache-expire nil) ;; prevents freezing when windows working with smb
(setq projectile-completion-system 'helm)
(helm-projectile-on)
(setq projectile-indexing-method 'alien) ;; prevents freezing in windows
;; (setq projectile-enable-caching nil)

(global-set-key (kbd "C-x i") 'projectile-invalidate-cache)
(setq projectile-switch-project-action 'helm-projectile)

