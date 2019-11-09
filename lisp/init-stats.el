;;; init-stats.el --- for R and julia
;;; Commentary:
;;; Code:
(require 'init-elpa)

(use-package julia-mode
  :init (require-package 'julia-mode)
  :defer t
  )

(use-package ess
  :init (require-package 'ess)
  :defer t
  ;; Bind M-- to assignment operator as in Rstudio. This is typically bound to
  ;; negative-argument, but C-M-- is also bound to negative-argument.
  :bind ("M--" . ess-insert-assign)
  )

(provide 'init-stats)
;;; init-stats.el ends here
