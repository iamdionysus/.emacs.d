(provide 'my-look-and-feel)

;;; Look and feel
;;

(menu-bar-mode -1) ;; no menu bar
(setq compilation-scroll-output t)  ;; automatically go to bottom of the compilation buffer
(column-number-mode t)



;;; setups for windows
;;
(if (eq system-type 'windows-nt)
  (progn  
    (tool-bar-mode -1) ;; no tool bar
    (add-to-list 'initial-frame-alist '(height . 50))
    (add-to-list 'initial-frame-alist '(width . 180))
    (add-to-list 'initial-frame-alist '(left . 0))
    (add-to-list 'initial-frame-alist '(top . 50))
    (set-language-environment "UTF-8")
    (set-face-attribute 'default nil :font "Consolas-12")
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
