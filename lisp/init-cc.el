;;; init-c.el --- for C/C++, possibly C# etc.
;;; Commentary:
;;; Code:
(require 'cc-mode)
(require 'init-company)

(require-package 'company-c-headers)
(add-to-list 'company-backends 'company-c-headers)

;; need to remove company-semantic from company-backends because it will take precedence over company-clang

;; (add-hook 'c-mode-hook
;; 	  (setq company-backends (delete 'company-semantic company-backends)))
;; (add-hook 'c++-mode-hook
;; 	  (setq company-backends (delete 'company-semantic company-backends)))
(add-hook 'c-mode-common-hook
	  (after-load 'company
	    '(delete 'company-semantic company-backends)))


(provide 'init-c)
;;; init-c.el ends here
