;;; Commonn-lisp compatibility
;;
(with-no-warnings
  (require 'cl))

;;; personal settings
;;
(setq inhibit-startup-screen t)
(if (eq system-type 'windows-nt)
    (setq w32-get-true-file-attributes nil))
(menu-bar-mode -1) ;; no menu bar
(setq compilation-scroll-output t)  ;; automatically go to bottom of the compilation buffer
(column-number-mode t)
(global-auto-revert-mode t) ;; refresh buffer when file changed
(load-theme 'monokai t)
(split-window-right)
(setq create-lockfiles nil) ;; solve broccoli issue which bothers ember-cli
(setq auto-save-visited-file-name t)
(setq backup-directory-alist
      '(("" . "~/.emacs.d/emacs-backup")))

(electric-pair-mode t)
(show-paren-mode t)
(setq blink-matching-paren nil)

(add-to-list 'auto-mode-alist '("Cask\\'" . emacs-lisp-mode))