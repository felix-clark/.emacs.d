;;; init-company.el --- for auto-completion
;;; Commentary:
;;; Code:
(require 'init-elpa)

(require-package 'company)
(add-hook 'after-init-hook 'global-company-mode)
(when (maybe-require-package 'company-quickhelp)
  (add-hook 'after-init-hook 'company-quickhelp-mode))

(setq tab-always-indent 'complete)
(add-to-list 'completion-styles 'initials t)

(setq company-tooltip-align-annotations t)

;; (add-hook 'prog-mode-hook 'company-mode)
;; (define-key prog-mode-map (kbd "TAB") #'company-indent-or-complete-common)



(provide 'init-company)
;;; init-company.el ends here
