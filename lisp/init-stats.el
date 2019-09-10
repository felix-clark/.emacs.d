;;; init-stats.el --- for R and julia
;;; Commentary:
;;; Code:
(require 'init-elpa)

(use-package julia-mode
  :init (require-package 'julia-mode)
  )

(use-package ess
  :init (require-package 'ess)
  :after julia-mode
  )

(provide 'init-stats)
;;; init-stats.el ends here
