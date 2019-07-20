;;; init-misc ---- Miscellaneous packages
;;; Commentary:
;;; Code:

(require 'init-elpa)

(use-package wttrin
  :commands (wttrin)
  :init
  (require-package 'wttrin)
  (setq wttrin-default-cities '("New York City"))
  )

(provide 'init-misc)
;;; init-misc.el ends here
