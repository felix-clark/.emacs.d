;;; init-flycheck.el --- configuration of flycheck
;;; Commentary:
;;; Code:

(require 'init-elpa)

(use-package flycheck
  :ensure t
  :diminish flycheck-mode
  :config
  (global-flycheck-mode)
  (setq flycheck-display-errors-function #'flycheck-display-error-messages-unless-error-list)
  ;; disable warning about only 1 space after period
  (setq sentence-end-double-space nil)
  )

(use-package flycheck-color-mode-line
  :ensure t
  :commands
  flycheck-color-mode-line-mode
  :config
  (add-hook 'flycheck-mode-hook #'flycheck-color-mode-line-mode)
  ;; ;; one of these is supposed to work instead:
  ;; :hook (flycheck-mode . flycheck-color-mode-line)
  ;; :hook flycheck-mode
  )
  
(provide 'init-flycheck)
;;; init-flycheck.el ends here
