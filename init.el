;;; init.el --- sets my style

;;; Commentary:
;;
;; this file is to set up my own Emacs environment
;; both linux and windows
;; recently started to use use-package to install package automatically

;;; Code:

;;; MELPA settgins
;;
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)


;;; Commonn-lisp compatibility
;;
(with-no-warnings
  (require 'cl))

;;; require use-package
;;
(require 'use-package)

;;; Look and feel
;;
(load-theme 'solarized-dark t) ;; solarized theme
(menu-bar-mode -1) ;; no menu bar
(tool-bar-mode -1) ;; no tool bar
(setq compilation-scroll-output t)  ;; automatically go to bottom of the compilation buffer
(setq make-backup-files nil) ;; no backup file ~

;;; fix ansi color break on compilation buffer
;;
;; (require 'ansi-color)
;; (defun colorize-compilation-buffer ()
;;   (read-only-mode)
;;   (ansi-color-apply-on-region (point-min) (point-max))
;;   (toggle-read-only)
;; )
;; (add-hook 'compilation-filter-hook 'colorize-compilation-buffer)


;;; shortcuts for productivity
;;
;;(global-set-key (kbd "RET") 'newline-and-indent) ;; better enter

;;; buffer-move
;;
(global-set-key (kbd "C-c <up>")     'buf-move-up)
(global-set-key (kbd "C-c <down>")   'buf-move-down)
(global-set-key (kbd "C-c <left>")   'buf-move-left)
(global-set-key (kbd "C-c <right>")  'buf-move-right)


;;; better deletion
;;
(global-set-key (kbd "C-w") 'backward-kill-word)
(global-set-key (kbd "C-x C-k") 'kill-region)

;;; manage window splits easily
;;
(global-set-key (kbd "C-x -") 'split-window-below)
(global-set-key (kbd "C-x \\") 'split-window-right)
(global-set-key (kbd "C-M-o") 'other-window)
;; (global-set-key (kbd "M-o") 'other-window) this is not working from mult-term
(global-set-key (kbd "C-M-h") 'shrink-window-horizontally)
(global-set-key (kbd "C-M-l") 'enlarge-window-horizontally)
(global-set-key (kbd "C-M-k") 'shrink-window)
(global-set-key (kbd "C-M-j") 'enlarge-window)

;; load-file
(global-set-key (kbd "C-x C-l") 'load-file)

;; dired moving to parent directory without opening a new buffer
(put 'dired-find-alternate-file 'disabled nil)
(add-hook 'dired-mode-hook
 (lambda ()
  (define-key dired-mode-map (kbd "^")
    (lambda () (interactive) (find-alternate-file "..")))
  ; was dired-up-directory
))


;;; smex
;;
(global-set-key (kbd "C-x C-m") 'smex)

;;; multi-term
;;
(if (eq system-type 'gnu/linux)
  (use-package multi-term
    :bind (("C-M-t" . multi-term))
    :ensure t)
)

;;; magit
;;
(use-package magit
  :bind ("C-x g" . magit-status)
  :ensure t)

;; -- flycheck settings
(add-hook 'after-init-hook #'global-flycheck-mode)
(setq flycheck-check-syntax-automatically '(save))

(defun flycheck-buffer-and-list-errors()
  "execute command flycheck-buffer and flycheck-list-errors"
  (interactive)
  (flycheck-buffer)
  (flycheck-list-errors)
  (other-window 1)
)

(defun flycheck-mode-keys()
  "key map for flycheck-mode"
  (local-set-key (kbd "<f7>") 'flycheck-buffer-and-list-errors)
)
(add-hook 'flycheck-mode-hook 'flycheck-mode-keys)


;; -- haskell-mode settings
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
;; (add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)

(setq haskell-hoogle-command "hoogle")

(defun haskell-process-load-and-jump()
  "run haskell-process-load-or-reload and move to other window"
  (interactive)
  (haskell-process-load-or-reload)
  (other-window 1)
)

(defun haskell-mode-keys()
  "key map for haskell-mode"
  (local-set-key (kbd "<f5>") 'haskell-process-load-and-jump)
  (local-set-key (kbd "<f6>") 'flycheck-buffer-and-list-errors)
)
(add-hook 'haskell-mode-hook 'haskell-mode-keys)



;; -- ruby settings: inf-ruby
(add-hook 'enh-ruby-mode-hook 'inf-ruby-minor-mode)
(setq enh-ruby-check-syntax 'nil)

;; -- ruby settigns: robe
(add-hook 'enh-ruby-mode-hook 'robe-mode)
;; (add-hook 'robe-mode-hook 'auto-complete-mode)


;; -- ruby enh-ruby-mode compile/run/debug settings
(add-to-list 'auto-mode-alist
	     '("\\.\\(?:gemspec\\|irbrc\\|gemrc\\|rake\\|rb\\|ru\\|thor\\)\\'" . enh-ruby-mode))
(add-to-list 'auto-mode-alist
	     '("\\(Capfile\\|Gemfile\\(?:\\.[a-zA-Z0-9._-]+\\)?\\|[rR]akefile\\)\\'" . enh-ruby-mode))


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

(defun ruby-save-compile-this-buffer()
  "save current buffer and compile the buffer"
  (interactive)
  (save-buffer)
  (ruby-compilation-this-buffer)
)

(defun toggle-breakpoint()
  "toggle breakpoint via binding.pry"
  (interactive)
  (beginning-of-line)
  (insert "binding.pry")
  (newline)
)

(defun delete-all-breakpoint()
  "delete all breakpoint  as binding.pry"
  (interactive)
  (let (pos-from)
    (setq pos-from (point))
    (beginning-of-buffer)
    (delete-matching-lines "binding.pry")
    (goto-char pos-from)
  )
)

(defun enh-ruby-mode-keys()
  "key maps for enh-ruby-mode only"
  (local-set-key (kbd "<f2>") 'inf-ruby)
  (local-set-key (kbd "<f5>") 'inf-ruby-and-load-file)
  (local-set-key (kbd "<f6>") 'ruby-save-compile-this-buffer)
  (local-set-key (kbd "<f9>") 'toggle-breakpoint)
  (local-set-key (kbd "<f10>") 'delete-all-breakpoint)
  (local-set-key (kbd "C-\\") 'ruby-send-last-sexp)
)
 
(add-hook 'enh-ruby-mode-hook 'enh-ruby-mode-keys)


;; -- ruby: ruby-tools-mode
(add-hook 'enh-ruby-mode-hook 'ruby-tools-mode)
(defun ruby-tools-mode-keys()
  "key map for ruby-tools-mode like vim surroud"
  (local-set-key (kbd "C-c '") 'ruby-tools-to-single-quote-string)
  (local-set-key (kbd "C-c \"") 'ruby-tools-to-double-quote-string)
  (local-set-key (kbd "C-c :") 'ruby-tools-to-symbol)
  (local-set-key (kbd "C-c ;") 'ruby-tools-clear-string)
)
(add-hook 'enh-ruby-mode-hook 'ruby-tools-mode-keys)

;; -- helm
(global-set-key (kbd "C-x m") 'helm-mini)
(global-set-key (kbd "C-x f") 'helm-projectile)
(global-set-key (kbd "C-c f") 'helm-projectile)
(global-set-key (kbd "C-x C-d") 'helm-find-files)

;; -- projectile
(projectile-global-mode)
(add-hook 'projectile-mode-hook 'projectile-rails-on)
(global-set-key (kbd "C-x p") 'projectile-find-file)
(global-set-key (kbd "C-c p") 'projectile-find-file)

;; -- smartparens
;; (smartparens-global-mode t)
;; (require 'smartparens-config)

;; -- auto-complete
;; (global-auto-complete-mode t)		

;;; company-mode
;;
(use-package company
  :init
  (progn
      (add-hook 'after-init-hook 'global-company-mode)
      (eval-after-load 'company
	'(add-to-list 'company-backends 'company-inf-ruby))
      (eval-after-load 'company
	'(push 'company-robe company-backends)))
  :bind
  (("M-SPC" . company-complete-common))
  :ensure t)


;; -- web-mode
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[gj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))

;; -- emmet-mode
(add-hook 'html-mode-hook 'emmet-mode)
(add-hook 'web-mode-hook 'emmet-mode)


;; -- flx-ido
(require 'flx-ido)
(ido-mode t)
(ido-everywhere t)
(flx-ido-mode t)
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)

;; -- setups for windows
(when window-system
  (add-to-list 'initial-frame-alist '(height . 50))
  (add-to-list 'initial-frame-alist '(width . 180))
  (add-to-list 'initial-frame-alist '(left . 0))
  (add-to-list 'initial-frame-alist '(top . 50))
  (set-language-environment "UTF-8")
  (set-face-attribute 'default nil :font "Consolas-12")
  (global-set-key [C-kanji] 'set-mark-command)
  (add-to-list 'exec-path "C:/Program Files (x86)/Aspell/bin/")
  (setq ispell-program-name "aspell")
  (setq ispell-personal-dictionary "C:/Program Files (x86)/Aspell/dict")
)


;;; init.el ends here
