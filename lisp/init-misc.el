;;; init-misc ---- Miscellaneous packages
;;; Commentary:
;;; Code:

(require 'init-elpa)

;; weather integration
(use-package wttrin
  :commands (wttrin)
  :init
  (require-package 'wttrin)
  (setq wttrin-default-cities '("New York City"))
  )

;; yaml files
(use-package yaml-mode
  :init (require-package 'yaml-mode))

;; dockerfile editing
(use-package dockerfile-mode
  :init (require-package 'dockerfile-mode)
  )

(provide 'init-misc)
;;; init-misc.el ends here
