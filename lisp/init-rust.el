;;; init-rust.el --- Rust utilities
;;; Commentary:
;;; Code:

(require 'init-elpa)

(use-package rust-mode
  :ensure t
  :defer t
  :hook (
	 ;; easy building with `C-c C-c C-*` where *={b|r|t} for `cargo {build|run|test}`
	 (rust-mode . cargo-minor-mode)
	 (rust-mode . racer-mode))
  ;; :bind (:map rust-mode-map
  ;; ;; we are using format-on-save but we could switch to this:
  ;; 	      ("C-c TAB" . rust-format-buffer))
  :config
  (setq rust-format-on-save t)
  ;; use rustup binaries PATH; doesn't appear necessary
  ;; (setq racer-cmd "~/.cargo/bin/racer")
  ;; point the the rust source installed with `rustup component add rust-src`
  (setq racer-rust-src-path (concat
			     ;; get rustsrc location and delete trailing '\n'
			     (substring (shell-command-to-string "rustc --print sysroot") 0 -1)
			     "/lib/rustlib/src/rust/src"))
  )

(use-package racer
  :ensure t
  :after (company rust-mode)
  ;; we're using global eldoc and company modes so we don't need to add these
  ;; :hook ((racer-mode . eldoc-mode) ; is eldoc not already activated? TODO:check
  ;; 	 (racer-mode . company-mode) ; should be included
  ;; 	 )
  ;; there are other options like company-complete-common-or-cycle
  :bind (:map racer-mode-map
	      ("TAB" . company-indent-or-complete-common))
  )

;; flycheck-rust is not on MELPA stable
(use-package flycheck-rust
  :after rust-mode
  :hook (flycheck-mode . flycheck-rust-setup)
  )

(provide 'init-rust)
;;; init-rust.el ends here
