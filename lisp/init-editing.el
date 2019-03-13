(require 'init-elpa)

;; always highlight complementary delimiters with zero delay
(setq show-paren-delay 0)
(show-paren-mode 1)

;; always show column number (line-number-mode is on by default)
(setq column-number-mode t)

;; set flyspell for spellcheck on by default
(require 'flyspell)
(add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'prog-mode-hook 'flyspell-prog-mode)

;; return to last place you were in when the file was opened
;; saved in ~/.emacs.d/places/, or ~/.emacs-places in older versions.
;; in emacs 25 I won't need to (require 'saveplace)
(require 'saveplace)
(setq-default save-place t)
(setq save-place-file (concat user-emacs-directory "places"))
;; if slow to exit, try adding (setq save-place-forget-unreadable-files nil)
;; (save-place-mode 1) ;; change all this to this single line with emacs 25

;; different coloring of successive delimiter levels
(require-package 'rainbow-delimiters)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; automatically insert closing delimiters
(require 'electric)
(add-hook 'prog-mode-hook (electric-pair-mode 1))

(provide 'init-editing)
