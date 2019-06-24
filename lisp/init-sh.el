;;; init-sh.el --- Shell scripting functions
;;; Commentary:
;;; Most shell functionality is built-in, so this will not be large.
;;; Code:

(use-package fish-mode
  :init (require-package 'fish-mode))

(use-package company-shell
  :init
  (require-package 'company-shell)
  :after company
  :config
  (push 'company-shell company-backends)
  (push 'company-shell-env company-backends)
  (push 'company-fish-shell company-backends)
  )

(provide 'init-sh)
;;; init-sh.el ends here
