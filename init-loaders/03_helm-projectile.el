;;; helm
;;
(use-package helm
  :ensure t
  :init
  (setq helm-M-x-fuzzy-match t)
  (setq helm-buffers-fuzzy-matching t)
  (setq helm-recentf-fuzzy-matching t)
  (setq helm-split-window-in-side-p t)
  (require 'helm-config))

;;; projectile
;;
(use-package projectile
  :ensure t
  :config
  (projectile-global-mode))
  ;; :init
  ;; (setq projectile-completion-system 'helm)

;;; helm-projectile
;;
(use-package helm-projectile
  :ensure t
  :bind (("C-x p" . helm-projectile-find-file)
	 ("C-x C-p" . helm-projectile-switch-project))
  :config
  (helm-projectile-on))

;;; shortcuts
;;
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action)
(define-key helm-map (kbd "C-z") 'helm-select-action)
(global-set-key (kbd "C-x m") 'helm-mini)
(global-set-key (kbd "C-x b") 'helm-buffers-list)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x C-m") 'helm-M-x)
(global-set-key (kbd "C-x C-h") 'helm-apropos)
(global-set-key (kbd "C-x p") 'helm-projectile-find-file)
(global-set-key (kbd "C-x C-p") 'helm-projectile-switch-project)
(global-set-key (kbd "C-x f") 'helm-occur)

;; (custom-set-variables
;;   '(helm-ag-base-command "pt --nocolor --nogroup"))
;; ;;; projectile
;; ;;
;; (projectile-global-mode)
;; (setq projectile-file-exists-remote-cache-expire nil) ;; prevents freezing when windows working with smb
;; (setq projectile-completion-system 'helm)
;; (helm-projectile-on)
;; (setq projectile-indexing-method 'alien) ;; prevents freezing in windows
;; ;; (setq projectile-enable-caching nil)

;; (global-set-key (kbd "C-x i") 'projectile-invalidate-cache)
;; (setq projectile-switch-project-action 'helm-projectile)

