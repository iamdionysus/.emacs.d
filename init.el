2;;; init.el --- sets my style

;;; Commentary:
;;
;; this file is to set up my own Emacs environment
;; both linux and windows
;; recently started to use use-package to install package automatically

;;; Code:

;;; el-get settings
;;
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(require 'el-get)
(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")

(el-get-bundle flx-ido)
(el-get-bundle projectile)
(el-get-bundle evil-nerd-commenter)

;; (require 'benchmark-init)

;;; Commonn-lisp compatibility
;;
(with-no-warnings
  (require 'cl))

;;; personal settings
;;
(global-auto-revert-mode t) ;; refresh buffer when file changed
(load-theme 'wombat)
(split-window-right)
(setq create-lockfiles nil) ;; solve broccoli issue which bothers ember-cli
(setq auto-save-visited-file-name t)
(setq backup-directory-alist
      '(("" . "~/.emacs.d/emacs-backup")))
(add-to-list 'load-path "~/.emacs.d/config")

;;; shortcuts
;;
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
(global-set-key (kbd "C-x C-j") 'eval-last-sexp)

;;; my-util
;;
(global-set-key (kbd "C-x C-m") 'smex)
(global-set-key (kbd "C-x p") 'projectile-find-file)
(global-set-key (kbd "C-x i") 'projectile-invalidate-cache)
(global-set-key (kbd "C-x m") 'recentf-open-files)
(if (window-system)
    (progn
      (global-set-key (kbd "C-M-t") 'eshell))
  (progn
    (global-set-key (kbd "C-M-t") 'multi-term)
    (global-set-key (kbd "C-x .") 'multi-term-next)
    (global-set-key (kbd "C-x ,") 'multi-term-prev)
    (global-set-key (kbd "C-c C-k") 'term-char-mode)
    (global-set-key (kbd "C-c C-l") 'term-line-mode)))

(global-set-key (kbd "C-x C-SPC") 'ace-jump-mode)

;;; my-dev
;;
(global-set-key (kbd "M-SPC") 'company-complete-common)
(eval-after-load 'org
  '(progn
     (define-key org-mode-map (kbd "C-M-n") 'outline-next-visible-heading)
     (define-key org-mode-map (kbd "C-M-p") 'outline-previous-heading)
     (define-key org-mode-map (kbd "C-c C-x C-k") 'org-cut-special)))

(defun comment-or-uncomment-line-and-forward-line()
    "evilnc-comment-or-uncomment-lines and move to next-line"
  (interactive)
  (evilnc-comment-or-uncomment-lines 1)
  (forward-line)
  (beginning-of-line))

(global-set-key (kbd "M-;") 'comment-or-uncomment-line-and-forward-line)
;; (global-set-key (kbd "M-;") 'evilnc-comment-or-uncomment-lines)
(global-set-key (kbd "C-M-;") 'evilnc-comment-or-uncomment-paragraphs)

(defun web-mode-inside-next-element()
  "move to next html element and select element content"
  (interactive)
  (web-mode-element-end)
  (web-mode-element-next)
  (web-mode-element-content-select))

(defun web-mode-inside-previous-element()
  "move to next html element and select element content"
  (interactive)
  (web-mode-element-beginning)
  (web-mode-element-previous)
  (web-mode-element-content-select))

(eval-after-load 'web-mode
  '(progn
     (define-key web-mode-map (kbd "C-M-n") 'web-mode-inside-next-element)
     (define-key web-mode-map (kbd "C-M-p") 'web-mode-inside-previous-element)))

;;; my-ruby
;;
(eval-after-load 'rinari
  '(progn
    (add-hook 'ruby-mode-hook 'rinari-minor-mode)
    (define-key rinari-minor-mode-map (kbd "C-c m") 'rinari-find-model)
    (define-key rinari-minor-mode-map (kbd "C-c f") 'rinari-find-fixture)
    (define-key rinari-minor-mode-map (kbd "C-c c") 'rinari-find-controller)
    (define-key rinari-minor-mode-map (kbd "C-c r") 'rinari-find-routes)
    (define-key rinari-minor-mode-map (kbd "C-c g") 'rinari-find-migration)
    (define-key rinari-minor-mode-map (kbd "C-c t") 'rinari-find-test)))

;;; ruby settings: inf-ruby
;;
(defun inf-ruby-and-load-file()
  "execute command inf-ruby and ruby-load-file"
  (interactive)
  (let (file-name-from)
    (setq file-name-from buffer-file-name)
    (save-buffer)
    (inf-ruby)
    (ruby-load-file file-name-from)
  )
)

(defun toggle-breakpoint()
  "toggle breakpoint via binding.pry"
  (interactive)
  (beginning-of-line)
  (insert "binding.pry")
  (newline)
)

(defun delete-all-breakpoint()
  "delete all breakpoint as binding.pry"
  (interactive)
  (let (pos-from)
    (setq pos-from (point))
    (beginning-of-buffer)
    (delete-matching-lines "binding.pry")
    (goto-char pos-from)
  )
)

;; ("<f2>" . inf-ruby)
;; ("<f5>" . inf-ruby-and-load-file)
;; ;; ("<f6>" . ruby-save-compile-this-buffer)
;; ("<f9>" . toggle-breakpoint)
;; ("<f10>" . delete-all-breakpoint)
;; ("C-\\" . ruby-send-last-sexp)


;;; package settings
;;
;; (require 'my-ruby)

(if (eq system-type 'windows-nt)
    (setq w32-get-true-file-attributes nil))

;; (unless (eq system-type 'windows-nt)
;;   (require 'my-ocaml))

;;; flycheck
;;
;; (add-hook 'after-init-hook #'global-flycheck-mode)

;;; electric-pair-mode
;;
(electric-pair-mode t)
(show-paren-mode t)
(setq blink-matching-paren nil)

;;; flx-ido
;;
(require 'flx-ido)
(ido-mode t)
ido-everywhere t)
(flx-ido-mode t)
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)

;;; recentf
;;
(recentf-mode t)
(setq recentf-max-menu-items 50)


;;; projectile
;;
(projectile-global-mode)
(setq projectile-indexing-method 'alien)

;;; org
;;
(setq org-src-fontify-natively t)
(setq org-log-done 'time)
(setq org-return-follows-link t)

;;; company-mode
;;
;; (eval-after-load 'company
;; 	'(add-to-list 'company-backends 'company-inf-ruby))
(add-hook 'after-init-hook 'global-company-mode)
(eval-after-load 'company '(push 'company-robe company-backends))

;;; js-mode
;;
(setq js-indent-level 2)

;;; web-mode
;;
(add-to-list 'auto-mode-alist '("\\.hbs\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.[gj]sp\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
;; (setq web-mode-comment-style 2)
;; (setq web-mode-engines-alist
;; 	  '(("ctemplate" . "\\.hbs\\'")
;; 	    ("erb" . "\\.erb\\'"))

(defun my-web-mode-hook ()
  "Hooks for web mode."
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2))
(add-hook 'web-mode-hook 'my-web-mode-hook)

;;; emmet-mode
;;
(add-hook 'html-mode-hook 'emmet-mode)
(add-hook 'web-mode-hook 'emmet-mode)

;;; coffee-mode
;;
(custom-set-variables '(coffee-tab-width 2))

(setq inhibit-startup-screen t)

(menu-bar-mode -1) ;; no menu bar
(setq compilation-scroll-output t)  ;; automatically go to bottom of the compilation buffer
(column-number-mode t)



;;; setups for windows
;;
(if (eq system-type 'windows-nt)
  (progn  
    (tool-bar-mode -1) ;; no tool bar
    (add-to-list 'initial-frame-alist '(height . 53))
    (add-to-list 'initial-frame-alist '(width . 205))
    (add-to-list 'initial-frame-alist '(left . 0))
    (add-to-list 'initial-frame-alist '(top . 0))
    (set-language-environment "UTF-8")
    (set-face-attribute 'default nil :font "Source Code Pro-11")
    (add-to-list 'exec-path "C:/Program Files (x86)/Aspell/bin/")
    (setq ispell-program-name "aspell")
    (setq ispell-personal-dictionary "C:/Program Files (x86)/Aspell/dict")
  )
)

;;; settings for mac osx
;;
(if (eq system-type 'darwin)
  (progn
    (tool-bar-mode -1)
    (add-to-list 'initial-frame-alist '(height . 54))
    (add-to-list 'initial-frame-alist '(width . 200))
    (add-to-list 'initial-frame-alist '(left . 0))
    (add-to-list 'initial-frame-alist '(top . 10))
    (set-face-attribute 'default nil :font "Monaco-14")
  )
)


;;; init.el ends here
