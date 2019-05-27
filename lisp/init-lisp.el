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
(when (maybe-require-package 'auto-compile)
  (add-hook 'after-init-hook 'auto-compile-on-save-mode)
  (add-hook 'after-init-hook 'auto-compile-on-load-mode))

(provide 'init-lisp)
;;; init-lisp.el ends here
