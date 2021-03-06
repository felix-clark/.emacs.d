;;; init-js --- Javascript and typescript
;;; Commentary:
;;; Code:

(require 'init-elpa)

(use-package typescript-mode
  :ensure t
  :defer t
  )

(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  ;; (flycheck-mode t) ;; is this already activated
  ;; this is less aggressive than the default
  ;; (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode t)
  (tide-hl-identifier-mode +1)
  (company-mode t)
  (setq typescript-indent-level 2)
  (setq js2-indent-level 2)
  )

(use-package tide
  :ensure t
  :after company
  :defer t
  :hook
  ((typescript-mode . setup-tide-mode)
   (js2-mode . setup-tide-mode)
   ;; formatting before save may cause commits to be unreadable
   ;; (before-save . tide-format-before-save)
   )
  )

(provide 'init-js)
;;; init-js.el ends here
