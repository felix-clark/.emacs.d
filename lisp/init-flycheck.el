;;; init-flycheck.el --- configuration of flycheck
;;; Commentary:
;;; Code:

(require 'init-elpa)

(use-package flycheck
  :ensure t
  :init
  (require-package 'flycheck)
  (global-flycheck-mode)
  (setq flycheck-display-errors-function #'flycheck-display-error-messages-unless-error-list)
  ;; disable warning about only 1 space after period
  (setq sentence-end-double-space nil)
  )

(use-package flycheck-color-mode-line
  :commands
  flycheck-color-mode-line-mode
  :init
  (add-hook 'flycheck-mode-hook #'flycheck-color-mode-line-mode)
  ;; ;; one of these is supposed to work instead:
  ;; :hook (flycheck-mode . flycheck-color-mode-line)
  ;; :hook flycheck-mode
  )
  
(provide 'init-flycheck)
;;; init-flycheck.el ends here
