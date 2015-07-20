(server-start)
(setq w32-get-true-file-attributes nil)
(scroll-bar-mode -1)
;;; font should be set first to get frame-char-width, line-pixel-height correct
(set-face-attribute 'default nil :font "Source Code Pro-11")

(let ((max-height (/
		   (if (> (display-pixel-height) 1080) 1080 (display-pixel-height))
		   (line-pixel-height)))
      (max-width (/
		  (if (> (display-pixel-width) 1920) 1920 (display-pixel-width))
		  (frame-char-width)))
      ;; windows task bar
      (height-delta 3)
      ;; windows outer frame
      (width-delta 4))
  (add-to-list 'initial-frame-alist (cons 'height (- max-height height-delta)))
  (add-to-list 'initial-frame-alist (cons 'width (- max-width width-delta))))

(add-to-list 'initial-frame-alist '(left . 0))
(add-to-list 'initial-frame-alist '(top . 0))
(set-language-environment "UTF-8")
(add-to-list 'exec-path "C:/Program Files (x86)/Aspell/bin/")
(setq ispell-program-name "aspell")
(setq ispell-personal-dictionary "C:/Program Files (x86)/Aspell/dict")

(use-package powershell
  :defer t
  :ensure t
  :init
  (setq powershell-indent 2))
