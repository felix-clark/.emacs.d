;;; init-lisp.el --- Emacs Lisp utility
;;; Commentary:
;;; Code:

(require 'init-elpa)
(require 'init-utils)

;; ----------------------------------------------------------------------------
;; Load .el if newer than corresponding .elc
;; ----------------------------------------------------------------------------
(setq load-prefer-newer t)

;; ----------------------------------------------------------------------------
;; Automatic byte compilation
;; ----------------------------------------------------------------------------
;; requires emacs 25
(when (version<= "25" emacs-version)
  (use-package auto-compile
    :hook ((after-init . auto-compile-on-save-mode)
	   (after-init . auto-compile-on-load-mode))
    )
  )

(provide 'init-lisp)
;;; init-lisp.el ends here
