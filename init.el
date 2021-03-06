;;; init.el --- loads other elisp scripts
;;; Commentary:
;;; Code:

;; Make startup faster by reducing the frequency of garbage
;; collection.  The default is 800 kilobytes.  Measured in bytes.
;; This will be turned down at the end of the init, but still
;; above the overly-conservative default.
(setq gc-cons-threshold (* 50 1000 1000))

;; debug info, this can however become annoying in normal use.
;; uncomment when working on .emacs.d
;; (setq debug-on-error t)

;; look in the "lisp" directory for additional custom macros

;; We have this line in init-elpa, but Package.el adds it if we don't have it.
;; (package-initialize)

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;; let flycheck find the emacs config files
(setq-default flycheck-emacs-lisp-load-path 'inherit)

;; byte-compile everything that hasn't already been for speed. this can also
;; cause "Invalid function; after-load" so make sure to remove all .elc when
;; messing with that. this doesn't generally save much time (~ 0.05 s) and makes
;; debugging difficult so it really isn't worth it if things are changing at
;; all.
;; (byte-recompile-directory (expand-file-name "~/.emacs.d") 0)

;; load the code to deal with packages
(require 'init-elpa)

;; performance and profiling
(require 'init-profile)

;; code to handle UI aesthetics
(require 'init-ui)

;; config for editing text
(require 'init-editing)

;; navigation
(require 'init-navigation)

;; flycheck is used with other packages
(require 'init-flycheck)

;; company mode for tab-completion and yasnippet for code snippets
(require 'init-completion)

;; magit
(require 'init-git)

;; org mode
(require 'init-org)

;; load specific language configurations
(require 'init-sh)
(require 'init-lisp)
(require 'init-python)
(require 'init-cc)
(require 'init-rust)
(require 'init-haskell)
(require 'init-js)
(require 'init-stats)

;; load other file type configurations
(require 'init-csv)
(require 'init-tex)

;; load other miscellaneous packages
(require 'init-misc)

;; Make gc pauses after initialization faster by decreasing the threshold.
(setq gc-cons-threshold (* 2 1000 1000))

(provide 'init)
;;; init.el ends here
