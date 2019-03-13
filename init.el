;;; init.el --- loads other elisp scripts
;;; Commentary:
;;; Code:

;; debuging
;(setq debug-on-error t)

;; look in the "lisp" directory for additional custom macros
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;; let flycheck find the emacs config files
(setq-default flycheck-emacs-lisp-load-path 'inherit)

;; byte-compile everything that hasn't already been for speed
;; in emacs 25 this can likely be replaced by auto-compile
;; this can also cause "Invalid function; after-load"
;; so remove all .elc when messing with that
(byte-recompile-directory (expand-file-name "~/.emacs.d") 0)

;; custom lisp functions
(require 'init-utils)

;; load the code to deal with packages
(require 'init-elpa)

;; code to handle UI aesthetics
(require 'init-ui)

;; config for editing text
(require 'init-editing)

;; flycheck is used with other packages
(require 'init-flycheck)

;; company mode for tab-completion
(require 'init-company)

;; load specific language configurations
(require 'init-lisp)
(require 'init-python)
(require 'init-rust)
(require 'init-haskell)

;; load other file type configurations
(require 'init-csv)

(provide 'init)
;;; init.el ends here
