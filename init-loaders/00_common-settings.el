;;; Commonn-lisp compatibility
;;
;; (with-no-warnings (require 'cl))

(eval-when-compile (require 'cl))

;;; personal settings
;;
(setq inhibit-startup-screen t)
(setq-default cursor-type 'bar)

(menu-bar-mode -1)
(tool-bar-mode -1)

(setq compilation-scroll-output t)  ;; automatically go to bottom of the compilation buffer
(column-number-mode t)
(global-auto-revert-mode t) ;; refresh buffer when file changed

(split-window-right)
(setq create-lockfiles nil) ;; solve broccoli issue which bothers ember-cli
(setq auto-save-visited-file-name t)
(setq backup-directory-alist
      '(("" . "~/.emacs.d/emacs-backup")))

(electric-pair-mode t)
(show-paren-mode t)
(setq blink-matching-paren nil)
