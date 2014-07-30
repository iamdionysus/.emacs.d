;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; MELPA setting
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; before loading everything else
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'cl) ;; Commonn-lisp compatibility 
(load-theme 'solarized-dark t) ;; solarized theme
(menu-bar-mode -1) ;; no menu bar
(tool-bar-mode -1) ;; no tool bar

;; compilation buffer set up
;; automatically go to bottom of the compilation buffer
(setq compilation-scroll-output t) 

;; fix ansi color break on compilation buffer
(require 'ansi-color)
(defun colorize-compilation-buffer ()
  (toggle-read-only)
  (ansi-color-apply-on-region (point-min) (point-max))
  (toggle-read-only)
)
(add-hook 'compilation-filter-hook 'colorize-compilation-buffer)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; shortcuts for productivity
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; better enter
(global-set-key (kbd "RET") 'newline-and-indent)

;; better deletion
(global-set-key (kbd "C-w") 'backward-kill-word)
(global-set-key (kbd "C-x C-k") 'kill-region)
(global-set-key (kbd "C-c C-k") 'kill-region)

;; -- manage window splits easily
(global-set-key (kbd "C-x -") 'split-window-below)
(global-set-key (kbd "C-x \\") 'split-window-right)
(global-set-key (kbd "C-M-o") 'other-window)
;; (global-set-key (kbd "M-o") 'other-window) this is not working from mult-term
(global-set-key (kbd "C-M-h") 'shrink-window-horizontally)
(global-set-key (kbd "C-M-l") 'enlarge-window-horizontally)
(global-set-key (kbd "C-M-k") 'shrink-window)
(global-set-key (kbd "C-M-j") 'enlarge-window)


;; -- load-file
(global-set-key (kbd "C-x C-l") 'load-file)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; each packages
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; smex
(global-set-key (kbd "C-x C-m") 'smex)
(global-set-key (kbd "C-c C-m") 'smex)
(global-set-key (kbd "C-c m") 'smex) ;; even more generous for sloppy finger
(global-set-key (kbd "C-x m") 'smex) ;; even more generous for sloppy finger


;; multi-term
(global-set-key (kbd "C-M-t") 'multi-term)


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


;; -- ruby settigns: robe
(add-hook 'enh-ruby-mode-hook 'robe-mode)
(add-hook 'robe-mode-hook 'auto-complete-mode)


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
(global-set-key (kbd "C-x h") 'helm-mini)
(global-set-key (kbd "C-c h") 'helm-mini)
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
(global-auto-complete-mode t)


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

;; -- windows font
(set-face-attribute 'default nil :font "Consolas-12")
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; after loading settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("1e7e097ec8cb1f8c3a912d7e1e0331caeed49fef6cff220be63bd2a6ba4cc365" default)))
 '(quack-programs (quote ("/usr/bin/mit-scheme" "bigloo" "csi" "csi -hygienic" "gosh" "gracket" "gsi" "gsi ~~/syntax-case.scm -" "guile" "kawa" "mit-scheme" "mzscheme" "racket" "racket -il typed/racket" "rs" "ruby" "scheme" "scheme48" "scsh" "sisc" "stklos" "sxi"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
