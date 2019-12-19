;;; init-lisp.el --- Emacs Lisp utility
;;; Commentary:
;;; Code:

(require 'init-elpa)

;; ----------------------------------------------------------------------------
;; Load .el if newer than corresponding .elc
;; ----------------------------------------------------------------------------
(setq load-prefer-newer t)

;; ----------------------------------------------------------------------------
;; Automatic byte compilation
;; ----------------------------------------------------------------------------
;; requires emacs 25
(use-package auto-compile
  :ensure t
  :if (version<= "25" emacs-version)
  :hook ((after-init . auto-compile-on-save-mode)
         (after-init . auto-compile-on-load-mode))
  )

(provide 'init-lisp)
;;; init-lisp.el ends here
