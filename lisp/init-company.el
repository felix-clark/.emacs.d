;; company-mode for autocompletion
(require 'init-elpa)

(require-package 'company)
(require 'company)

(setq company-tooltip-align-annotations t)
(add-hook 'prog-mode-hook 'company-mode)
(define-key prog-mode-map (kbd "TAB") #'company-indent-or-complete-common)

(provide 'init-company-mode)
