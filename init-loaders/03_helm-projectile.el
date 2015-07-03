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
  :init
  (setq projectile-file-exists-remote-cache-expire nil) ;; prevents freezing when windows working with smb
  (setq projectile-enable-caching nil) ;; prevents freezing when windows working with git indexing method
  (setq projectile-indexing-method 'alien) ;; prevents freezing when windows working with git indexing method
  ;; (setq projectile-completion-system 'helm)
  :config
  (projectile-global-mode))

;;; helm-projectile
;;
(use-package helm-projectile
  :ensure t
  :bind (("C-x p" . helm-projectile-find-file)
	 ("C-x C-p" . helm-projectile-switch-project)))

;;; shortcuts
;;
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action)
(define-key helm-map (kbd "C-z") 'helm-select-action)
(global-set-key (kbd "C-x m") 'helm-mini)
(global-set-key (kbd "C-x C-m") 'helm-M-x)
(global-set-key (kbd "C-x b") 'helm-buffers-list)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x C-h") 'helm-apropos)
(global-set-key (kbd "C-x f") 'helm-occur)
(global-set-key (kbd "C-x i") 'projectile-invalidate-cache)
;; (global-set-key (kbd "C-x C-p") 'helm-projectile-switch-project)
;; (global-set-key (kbd "C-x p") 'helm-projectile-find-file)

;; (custom-set-variables
;;   '(helm-ag-base-command "pt --nocolor --nogroup"))
;; ;;; projectile
;; ;;
;; (projectile-global-mode)
;; (helm-projectile-on)

;; (setq projectile-switch-project-action 'helm-projectile)

;;; swiper
;;
;; (use-package swiper
  ;; :ensure t
  ;; :init (setq ivy-use-virtual-buffers t)
  ;; :config
  ;; (ivy-mode t)
  ;; (global-set-key "\C-s" 'swiper)
  ;; (global-set-key "\C-r" 'swiper)
  ;; (global-set-key (kbd "C-c C-r") 'ivy-resume)
  ;; (global-set-key [f6] 'ivy-resume)
  ;; (global-set-key (kbd "C-x C-m") 'execute-extended-command))
