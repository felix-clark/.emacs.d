;; this file belongs in ~/.emacs or, preferably, ~/.emacs.d/init.el .

;; look in the "lisp" directory for additional custom macros
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;; byte-compile everything that hasn't already been for speed
(byte-recompile-directory (expand-file-name "~/.emacs.d") 0)

;; load the code to deal with packages
(require 'init-elpa)

;; code to handle UI aesthetics
(require 'init-ui)

;; config for editing text
(require 'init-editing)

;; company mode for tab-completion
(require 'init-company-mode)

;; load specific language configurations
(require 'init-rust)

(provide 'init)
