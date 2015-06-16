2;;; init.el --- sets my style

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
(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")

(el-get-bundle init-loader)
(el-get-bundle projectile)
(el-get-bundle evil-nerd-commenter)
(el-get-bundle init-loader)
(el-get-bundle golden-ratio)
(el-get-bundle org)

(el-get-bundle projectile)
(el-get-bundle helm)
(el-get-bundle helm-projectile)

(require 'init-loader)
(custom-set-variables '(init-loader-show-log-after-init 'error-only))
(init-loader-load "~/.emacs.d/init-loaders")

;;; init.el ends here
