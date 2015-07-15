(server-start)
(if (eq system-type 'windows-nt)
    (setq w32-get-true-file-attributes nil))

(add-to-list 'initial-frame-alist '(height . 53))
(add-to-list 'initial-frame-alist '(width . 205))
(add-to-list 'initial-frame-alist '(left . 0))
(add-to-list 'initial-frame-alist '(top . 0))
(set-language-environment "UTF-8")
(set-face-attribute 'default nil :font "Source Code Pro-11")
(add-to-list 'exec-path "C:/Program Files (x86)/Aspell/bin/")
(setq ispell-program-name "aspell")
(setq ispell-personal-dictionary "C:/Program Files (x86)/Aspell/dict")

(use-package powershell
  :defer t
  :ensure t
  :init
  (setq powershell-indent 2))
