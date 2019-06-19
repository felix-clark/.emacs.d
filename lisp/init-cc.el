;;; init-cc.el --- for C/C++/C#.
;;; Commentary:
;;; TODO: At the moment, tab completion doesn't actually seem to work.
;;; we need more configuration with irony/clang.
;;; see "Compilation Database" in irony documentation.
;;; might need to overwrite company-backends or remove some.
;;; look into rtags as well (company-rtags, flycheck-rtags, ivy-rtags).
;;; for completion, will need to choose between company-rtags and company-irony.
;;; check out cmake-ide for a complete package
;;; Code:

(use-package cc-mode
  :defer t ;; should autoload only in the right modes
  :init
  (require-package 'cc-mode)
)

;; use irony for c-type
;; will need to run irony-install-server manually to set up server
;; see https://github.com/Sarcasm/irony-mode/issues/167
;; on ubuntu install libclang-3.8-dev (for instance)
(use-package irony
  :after (counsel)
  :init (require-package 'irony)
  ;; activate for common c-like languages
  ;; :hook (c++-mode c-mode objc-mode)
  ;; :hook ((c++-mode c-mode objc-mode) . irony-mode)
  :hook (cc-mode . irony-mode)
  :config
  ;; use suggested configuration
  (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
  
  ;; use counsel-irony
  (defun use-counsel-irony ()
    (define-key irony-mode-map
      [remap completion-at-point] 'counsel-irony)
    (define-key irony-mode-map
      [remap complete-symbol] 'counsel-irony))
  (add-hook 'irony-mode-hook 'use-counsel-irony)
  )

;; activate irony-eldoc
(use-package irony-eldoc
  :after (irony eldoc)
  :init
  (require-package 'irony-eldoc)
  :config
  (add-hook 'irony-mode-hook #'irony-eldoc)
  )

;; activate flycheck-irony to use clang instead of flycheck's default gcc
(use-package flycheck-irony
  :after (flycheck irony)
  :init
  (require-package 'flycheck-irony)
  :config
  (eval-after-load 'flycheck
    '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))
  )

;; use company-irony
(use-package company-irony
  :after (company irony)
  :init
  (require-package 'company-irony)
  :config
  ;; (eval-after-load 'company
  ;;   '(add-to-list 'company-backends 'company-irony))
  (push 'company-irony company-backends)
  ;; use yasnippet version, and assume use-package takes care of loading.
  ;; but now we edit every element of company-backends to be used w/ yasnippet, so the above line is sufficient.
  ;; '(add-to-list 'company-backends (company-mode/backend-with-yas 'company-irony))
  )

;; may take some more configuration to find the right directory, see github
(use-package company-c-headers
  :init (require-package 'company-c-headers)
  :after (company)
  :config
  (add-to-list 'company-backends 'company-c-headers)
  )

;; TODO: make auto-indentation use clang-format?
;; will cause errors if clang-format is not installed in OS
(use-package clang-format
  :after cc-mode
  :init
  (require-package 'clang-format)
  ;; clang-format-region can be triggered using "C-M-\"
  :bind
  ("C-M-\\" . clang-format-region)
  ;; ("C-i" . clang-format) ;; doesn't work
  :config
  ;; (fset 'c-indent-region 'clang-format-region) ;; doesn't seem to work either
  ;; auto-format upon save
  (add-hook 'before-save-hook 'clang-format-buffer)
  
  ;; to create clang-format file using google style:
  ;; clang-format -style=google -dump-config > .clang-format
  ;; TODO: should look in git root directory first
  (if (not (file-exists-p ".clang-format"))
      (setq clang-format-style-option "google"))
  )


;; is the rest of this garbage?

;; need to remove company-semantic from company-backends because it will take precedence over company-clang
;; company-irony is better though

;; (add-hook 'c-mode-common-hook
;; 	  (after-load 'company
;; 	    '(add-to-list 'company-backends 'company-c-headers)
;; 	    '(delete 'company-semantic company-backends)))


(provide 'init-cc)
;;; init-cc.el ends here
