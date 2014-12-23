(provide 'my-ocaml)

;;; tuareg
;;
(use-package tuareg
  :ensure t
  :init
  (progn
    (autoload 'utop-setup-ocaml-buffer "utop" "Toplevel for OCaml" t)
    (add-hook 'tuareg-mode-hook 'utop-setup-ocaml-buffer)
    (add-hook 'tuareg-mode-hook 'merlin-mode)
    ))

;;; utop
;;
(use-package utop
  :ensure t)

;;; merlin - needs opam install merlin
;;
;; set opam-share variable to user's .opam share
(setq opam-share (substring (shell-command-to-string "opam config var share 2> /dev/null") 0 -1))
;; emacs related codes are in /emacs/site-lisp and load them all
(add-to-list 'load-path (concat opam-share "/emacs/site-lisp"))
(require 'merlin)

;;; ocp-indent - needs opam install ocp-indent
;;
;; ocp-indent.el is already loaded from the code above
(require 'ocp-indent)
