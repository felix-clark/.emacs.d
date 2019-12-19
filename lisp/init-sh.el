;;; init-sh.el --- Shell scripting functions
;;; Commentary:
;;; Most shell functionality is built-in, so this will not be large.
;;; Code:

(use-package fish-mode
  :ensure t
  :defer t
  )

(use-package company-shell
  :ensure t
  :after company
  :defer t
  :config
  (push 'company-shell company-backends)
  (push 'company-shell-env company-backends)
  (push 'company-fish-shell company-backends)
  )

(provide 'init-sh)
;;; init-sh.el ends here
