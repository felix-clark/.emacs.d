;;; init-tex.el --- LaTeX stuff
;;; Commentary:
;;; Code:

(use-package company-auctex
  :ensure t
  :defer t
  :hook (LaTeX-mode . company-auctex-init)
  ;; this tab behavior is actually annoying
  ;; :bind (:map LaTeX-mode-map
  ;; 	      ("TAB" . company-complete-common-or-cycle)
  ;; 	      )
  )

(provide 'init-tex)
;;; init-tex.el ends here
