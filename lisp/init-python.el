;;; init-python --- Python utility
;;; Commentary:
;;; anaconda-mode and company-anaconda doesn't seem to be as good with auto-completions as basic company mode.
;;; this should be played with more (don't forget to remove .elc)
;;; Code:

(require 'init-elpa)
(require 'init-company)

(require-package 'pip-requirements)

;; configure python company -- should this be done separately from company-anaconda?
;; (add-hook 'python-mode-hook 'company-mode)
;; (define-key company-mode-map (kbd "TAB") #'company-complete-common-or-cycle)
;;(define-key company-mode-map (kbd "TAB") #'company-indent-or-complete-common)

;; anaconda-mode requires emacs 25
(when (maybe-require-package 'anaconda-mode)
  (after-load 'python
    (add-hook 'python-mode-hook 'anaconda-mode)
    (add-hook 'python-mode-hook 'anaconda-eldoc-mode))
  (when (maybe-require-package 'company-anaconda)
    (after-load 'company
      (after-load 'python
	(push 'company-anaconda company-backends)))))

;; seems like flycheck already activated
;; (require-package 'flycheck)
;; (when (require 'flycheck nil t)
;;   (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
;;   (add-hook 'elpy-mode-hook 'flycheck-mode))

(use-package ein
  :init (require-package 'ein)
  )
;; these aren't real packages?
;; (use-package ein-notebook
;;   :init (require-package 'ein-notebook)
;;   )
;; (use-package ein-subpackages
;;   :init (require-package 'ein-subpackages)
;; )

(provide 'init-python)
;;; init-python.el ends here
