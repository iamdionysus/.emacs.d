;;; init.el --- sets my style

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
(add-to-list 'el-get-recipe-path "~/.emacs.d/recipes")

;;; essential
;;
(el-get-bundle init-loader)
(el-get-bundle golden-ratio)
(el-get-bundle org)
(el-get-bundle elpa:evil-nerd-commenter)

(el-get-bundle projectile)
(el-get-bundle helm)
(el-get-bundle helm-projectile)

(el-get-bundle company)
(el-get-bundle ag)
(el-get-bundle elpa:flycheck)

;;; modes
;;
(el-get-bundle scala-mode2)
(el-get-bundle web-mode)
(el-get-bundle emmet-mode)
(el-get-bundle markdown-mode)
(el-get-bundle yaml-mode)
(el-get-bundle coffee-mode)
(el-get-bundle json-mode)

;;; clojure
;;
(el-get-bundle cider)

;;; ruby
;;
(el-get-bundle elpa:rinari)
(el-get-bundle robe)
(el-get-bundle ruby-tools)
(el-get-bundle inf-ruby)

(require 'init-loader)
(custom-set-variables '(init-loader-show-log-after-init 'error-only))
(init-loader-load "~/.emacs.d/init-loaders")

;;; init.el ends here
