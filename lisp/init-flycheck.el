(require 'init-elpa)

(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode)
  (setq flycheck-display-errors-function #'flycheck-display-error-messages-unless-error-list)
  )

;; this doesn't work for some reason?
(use-package flycheck-color-mode-line
  :commands
  flycheck-color-mode-line-mode
  :init
  (add-hook 'flycheck-mode-hook #'flycheck-color-mode-line-mode)
  ;; ;; one of these is supposed to work instead:
  ;; :hook (flycheck-mode . flycheck-color-mode-line)
  ;; :hook flycheck-mode
  )

;; (when (maybe-require-package 'flycheck)
;;   (add-hook 'after-init-hook 'global-flycheck-mode)
;;   (setq flycheck-display-errors-function #'flycheck-display-error-messages-unless-error-list)
  
;; (when (maybe-require-package 'flycheck-color-mode-line)
;;   (add-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode))

(provide 'init-flycheck)
