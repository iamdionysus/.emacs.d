;;; projectile
;;
(use-package projectile
  :ensure t
  :init
  (setq projectile-file-exists-remote-cache-expire nil) ;; prevents freezing when windows working with smb
  (setq projectile-enable-caching nil) ;; prevents freezing when windows working with git indexing method
  (setq projectile-indexing-method 'alien) ;; prevents freezing when windows working with git indexing method
  ;; (setq projectile-completion-system 'helm)
  :config
  (projectile-global-mode))

;;; shortcuts
;;
(global-set-key (kbd "C-x i") 'projectile-invalidate-cache)
