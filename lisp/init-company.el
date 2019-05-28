;;; init-company.el --- for auto-completion
;;; Commentary:
;;; Code:
(require 'init-elpa)

(use-package company
  :ensure t
  :diminish (company-mode)
  :config
  (setq company-tooltip-align-annotations t)
  (global-company-mode)
  ;; we could use C-[np] instead of M-[np] to move within company completion menu
  ;; but it can be nice to have it be different
  ;; :bind (:map company-active-map
  ;; 	      ("M-n" . nil)
  ;; 	      ("M-p" . nil)
  ;; 	      ("C-n" . #'company-select-next)
  ;; 	      ("C-p" . #'company-select-previous))
  )

(use-package company-quickhelp
  :init
  (require-package 'company-quickhelp)
  :config
  (company-quickhelp-mode)
  )

;; (require-package 'company)
;; (add-hook 'after-init-hook 'global-company-mode)
;; (when (maybe-require-package 'company-quickhelp)
;;   (add-hook 'after-init-hook 'company-quickhelp-mode))

(setq tab-always-indent 'complete)
(add-to-list 'completion-styles 'initials t)

;; (setq company-tooltip-align-annotations t)

;; (add-hook 'prog-mode-hook 'company-mode)
;; (define-key prog-mode-map (kbd "TAB") #'company-indent-or-complete-common)



(provide 'init-company)
;;; init-company.el ends here
