;;; init-c.el --- for C/C++/C#.
;;; Commentary:
;;; Code:
(require 'cc-mode)
(require 'init-company)

;; use irony for c-type
(require-package 'irony)
;; will need to run irony-install-server manually to set up server
;; , but we are having trouble compiling right now
;; activate for common c-like languages
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)
;; use counsel-irony
(defun use-counsel-irony ()
  (define-key irony-mode-map
      [remap completion-at-point] 'counsel-irony)
  (define-key irony-mode-map
      [remap complete-symbol] 'counsel-irony))
(add-hook 'irony-mode-hook 'use-counsel-irony)
;; use suggested configuration
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
;; activate irony-eldoc
(require-package 'irony-eldoc)
(add-hook 'irony-mode-hook #'irony-eldoc)
;; activate flycheck-irony to use clang instead of flycheck's default gcc
;; (require-package 'flycheck-irony)
;; (eval-after-load 'flycheck
;;   '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))
;; use company-irony
(require-package 'company-irony)
(eval-after-load 'company
  '(add-to-list 'company-backends 'company-irony))

(use-package company-c-headers)



;; garbage?

;; having some difficulty with company-clang. try irony instead?
;; (require 'init-company)

;; (require-package 'company-c-headers)


;; need to remove company-semantic from company-backends because it will take precedence over company-clang

;; (add-hook 'c-mode-common-hook
;; 	  (after-load 'company
;; 	    '(add-to-list 'company-backends 'company-c-headers)
;; 	    '(delete 'company-semantic company-backends)))


(provide 'init-cc)
;;; init-cc.el ends here
