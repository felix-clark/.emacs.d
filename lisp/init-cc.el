;;; init-c.el --- for C/C++/C#.
;;; Commentary:
;;; TODO: At the moment, tab completion doesn't actually seem to work.
;;; we need more configuration with irony/clang.
;;; also using clang-format only while in C-like mode
;;; Code:
(require 'cc-mode)
(require 'init-company)

;; use irony for c-type
;; (require-package 'irony)
;; will need to run irony-install-server manually to set up server
;; see https://github.com/Sarcasm/irony-mode/issues/167
;; on ubuntu install libclang-3.8-dev (for instance)

;; activate for common c-like languages
;; (add-hook 'c++-mode-hook 'irony-mode)
;; (add-hook 'c-mode-hook 'irony-mode)
;; (add-hook 'objc-mode-hook 'irony-mode)
;; cc-mode should include all of these
(use-package irony
  ;; :hook (c++-mode c-mode objc-mode)
  :hook ((c++-mode c-mode objc-mode) . irony-mode)
  )
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
(use-package flycheck-irony
  :after (flycheck irony)
  :config
  (eval-after-load 'flycheck
    '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))
  )
;; need to download if not present, tho the warnings from use-package will make it easy to do manually
;; (require-package 'flycheck-irony)
;; (eval-after-load 'flycheck
;;   '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))
;; use company-irony
(use-package company-irony
  :after (company irony)
  :config
  (eval-after-load 'company
    '(add-to-list 'company-backends 'company-irony))
  )

;; may take some more configuration to find the right directory, see github
(use-package company-c-headers
  :after (company)
  :config
  (add-to-list 'company-backends 'company-c-headers)
  )

;; TODO: clean up these calls and make them activated for all cc-mode
;; Create clang-format file using google style:
;; clang-format -style=google -dump-config > .clang-format
;; will cause errors if clang-format is not installed
(require-package 'clang-format)
;; get default indentation behavior from clang
;; doesn't seem to work, though.
;; (add-hook 'c++-mode-hook
	  ;; (lambda () (global-set-key (kbd "C-i") 'clang-format)))
;; clang-format-region can be triggered using C-M-\
(add-hook 'c++-mode-hook
	  (lambda () (global-set-key (kbd "C-M-\\") 'clang-format-region)))
;; automatically format file on save
;; however, this appears to edit the buffer *after* the save, which is very annoying
;; (add-hook 'c++-mode-hook (lambda () (add-to-list 'write-file-functions 'clang-format-buffer)))

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
