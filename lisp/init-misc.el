;;; init-misc ---- Miscellaneous packages
;;; Commentary:
;;; Code:

(require 'init-elpa)

;; weather integration
(use-package wttrin
  :ensure t
  :commands (wttrin)
  :config
  (setq wttrin-default-cities '("New York City"))
  )

;; yaml files
(use-package yaml-mode
  :ensure t
  )

;; dockerfile editing
(use-package dockerfile-mode
  :ensure t
  )

(provide 'init-misc)
;;; init-misc.el ends here
