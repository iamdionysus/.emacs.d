(use-package cider
  :ensure t)

;;; To make example easy
;; (+ 3 5)
;;=> 8
(defun cider-eval-last-sexp-and-make-example ()
  "Evaluate the sexp, comment it and append result next line."
  (interactive)
  (let ((last-sexp (cider-last-sexp)))
    (backward-sexp)
    (mark-sexp)
    (paredit-comment-dwim)
    (end-of-line)
    (newline)
    (insert ";;=> ")
    (cider-interactive-eval last-sexp
			    (cider-eval-print-handler))))

(global-set-key (kbd "C-x e") 'cider-eval-last-sexp-and-make-example)
