;;; init-python --- Python utility
;;; Commentary:
;;; Code:

(require 'init-elpa)

(use-package pip-requirements
  :ensure t
  )

;; configure python company -- should this be done separately from company-anaconda?
;; (add-hook 'python-mode-hook 'company-mode)
;; (define-key company-mode-map (kbd "TAB") #'company-complete-common-or-cycle)
;;(define-key company-mode-map (kbd "TAB") #'company-indent-or-complete-common)


;; anaconda-mode requires emacs 25
(use-package anaconda-mode
  :ensure t
  :after (python)
  :if (version<= "25" emacs-version)
  ;; diminishing eldoc mode might be nice
  :hook ((python-mode . anaconda-mode)
         (python-mode . anaconda-eldoc-mode))
  )

(use-package company-anaconda
  :ensure t
  :after (company anaconda-mode)
  :if (version<= "25" emacs-version)
  :config
  (push 'company-anaconda company-backends)
  ;;  use with yasnippet
  ;; we are applying this map to all backends in the company config now
  ;; (push (company-mode/backend-with-yas 'company-anaconda) company-backends)
  )
  
(use-package ein
  :ensure t
  :if (version<= "25" emacs-version)
  )

;; seems like flycheck already activated
;; if we use elpy we can try to make it work with flycheck
;; (when (require 'flycheck nil t)
;;   (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
;;   (add-hook 'elpy-mode-hook 'flycheck-mode))


(provide 'init-python)
;;; init-python.el ends here
