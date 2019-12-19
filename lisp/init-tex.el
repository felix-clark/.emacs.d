;;; init-tex.el --- LaTeX stuff
;;; Commentary:
;;; Code:

(use-package company-auctex
  :ensure t
  :requires (company yasnippet)
  :defer t
  :hook (LaTeX-mode . company-auctex-init)
  ;; this tab behavior is actually annoying
  ;; :bind (:map LaTeX-mode-map
  ;; 	      ("TAB" . company-complete-common-or-cycle)
  ;; 	      )
  )

(provide 'init-tex)
;;; init-tex.el ends here
