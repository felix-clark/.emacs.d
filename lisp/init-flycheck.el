(require 'init-elpa)

(require-package 'flycheck)
(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode)
  (setq flycheck-display-errors-function #'flycheck-display-error-messages-unless-error-list)
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
