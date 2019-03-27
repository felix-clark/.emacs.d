;;; init.el --- loads other elisp scripts
;;; Commentary:
;;; Code:

;; debuging
(setq debug-on-error t)

;; look in the "lisp" directory for additional custom macros
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;; let flycheck find the emacs config files
(setq-default flycheck-emacs-lisp-load-path 'inherit)

;; byte-compile everything that hasn't already been for speed
;; this can also cause "Invalid function; after-load"
;; so remove all .elc when messing with that
;; (byte-recompile-directory (expand-file-name "~/.emacs.d") 0)

;; custom lisp functions
(require 'init-utils)

;; load the code to deal with packages
(require 'init-elpa)

;; code to handle UI aesthetics
(require 'init-ui)

;; config for editing text
(require 'init-editing)

;; navigation
(require 'init-navigation)

;; flycheck is used with other packages
(require 'init-flycheck)

;; company mode for tab-completion
(require 'init-company)

;; magit
(require 'init-git)

;; org mode
(require 'init-org)

;; load specific language configurations
(require 'init-lisp)
(require 'init-python)
(require 'init-cc)
(require 'init-rust)
(require 'init-haskell)

;; load other file type configurations
(require 'init-csv)
(require 'init-tex)

;; start server to enable emacsclient
;; it's not clear this is working, but there's not much point
;; in it until the configuration is stable.
;; see https://www.emacswiki.org/emacs/EmacsClient
;; (add-hook 'after-init-hook
;;           (lambda ()
;;             (require 'server)
;;             (unless (server-running-p)
;; 	      (server-start))))

(provide 'init)
;;; init.el ends here
