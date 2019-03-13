;;; init-tex.el --- LaTeX stuff
;;; Commentary:
;;; Code:

(when (maybe-require-package 'company-auctex)
  (company-auctex-init))

;; need to make TAB the company completion key
;; no need for indenting in latex so use complete-or-cycle
(define-key LaTeX-mode-map (kbd "TAB") #'company-complete-common-or-cycle)

(provide 'init-tex)
;;; init-tex.el ends here
