(require 'init-elpa)
(require 'init-company)

;; (require-package 'anaconda-mode)
;; (require-package 'company-anaconda)

;; seems to be a one-or-the-other with the company backend
;; (add-hook 'python-mode-hook 'anaconda-mode)

;; (eval-when-compile (defvar company-backends)) ;; warning about company-backends
;; not sure this does much...
;; (eval-after-load "company"
;;   '(add-to-list 'company-backends 'company-anaconda))
;; this version includes completions from an inferior python process
;; (eval-after-load "company"
;;    '(add-to-list 'company-backends '(company-anaconda :with company-capf)))

;; roll with elpy for now
(require-package 'elpy)
(add-hook 'python-mode-hook 'elpy-enable)

;; (require-package 'flycheck)
;; (when (require 'flycheck nil t)
;;   (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
;;   (add-hook 'elpy-mode-hook 'flycheck-mode))

;; (require-package 'py-autopep8)
;; (require 'py-autopep8)
;; (add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)


(provide 'init-python)
