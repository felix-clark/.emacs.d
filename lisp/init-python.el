;;; init-python --- Python utility
;;; Commentary:
;;; Code:

(require 'init-elpa)
(require 'init-company)

(require-package 'pip-requirements)

;; configure python company -- should this be done separately from company-anaconda?
;; (add-hook 'python-mode-hook 'company-mode)
;; (define-key company-mode-map (kbd "TAB") #'company-complete-common-or-cycle)
;;(define-key company-mode-map (kbd "TAB") #'company-indent-or-complete-common)


(when (version<= "25" emacs-version)
  ;; anaconda-mode requires emacs 25
  (use-package anaconda-mode
    :init (require-package 'anaconda-mode)
    :after (python)
    ;; diminishing eldoc mode might be nice
    :hook ((python-mode . anaconda-mode)
	   (python-mode . anaconda-eldoc-mode))
    )

  (use-package company-anaconda
    :init (require-package 'company-anaconda)
    :after (company anaconda-mode)
    :config (push 'company-anaconda company-backends)
    )
  
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
  )

;; seems like flycheck already activated
;; if we use elpy we can try to make it work with flycheck
;; (require-package 'flycheck)
;; (when (require 'flycheck nil t)
;;   (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
;;   (add-hook 'elpy-mode-hook 'flycheck-mode))


(provide 'init-python)
;;; init-python.el ends here
