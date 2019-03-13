;;; init-rust.el --- Rust utilities
;;; Commentary:
;;; Code:

(require 'init-elpa)
(require 'init-company)

(require-package 'racer)
(require-package 'rust-mode)
(require-package 'flycheck)

(require 'racer)
(require 'rust-mode)
(require 'eldoc)
(require 'flycheck)

;; this is probably not necessary, since emacs seems to understand that .rs are rust files
;; (add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))

;; easy building with `C-c C-c C-*` where *={b|r|t} for `cargo {build|run|test}`
(add-hook 'rust-mode-hook 'cargo-minor-mode)

;; use racer with company-mode for tab auto-completion
(add-hook 'rust-mode-hook #'racer-mode)
(add-hook 'racer-mode-hook #'eldoc-mode)
(add-hook 'racer-mode-hook #'company-mode) ;; should already be included

;; there are other options, like
;; company-complete-common-or-cycle
(define-key racer-mode-map (kbd "TAB") #'company-indent-or-complete-common)

;; flycheck-rust is not on MELPA stable
(when (maybe-require-package 'flycheck-rust)
  (after-load 'rust-mode
    (add-hook 'flycheck-mode-hook #'flycheck-rust-setup)))

;; setup rust-format-buffer
;; could also use rust-format-on-save
;; (add-hook 'rust-mode-hook
;; 	  '(lambda ()
;; 	     (local-set-key  (kbd "C-c TAB") #'rust-format-buffer)))

(after-load 'rust-mode
  (setq rust-format-on-save t)
  ;; use rustup binaries PATH; doesn't appear necessary
  ;; (setq racer-cmd "~/.cargo/bin/racer")
  ;; point the the rust source installed with `rustup component add rust-src`
  (setq racer-rust-src-path (concat
			     ;; get rustsrc location and delete trailing '\n'
			     (substring (shell-command-to-string "rustc --print sysroot") 0 -1)
			     "/lib/rustlib/src/rust/src"))
  )

(provide 'init-rust)
;;; init-rust.el ends here
