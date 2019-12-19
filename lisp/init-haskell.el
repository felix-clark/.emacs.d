;;; init-haskell.el --- Haskell utilities -*- lexical-binding: t -*-
;;; Commentary:
;;; uses intero for completion and flycheck, mostly from Purcell.
;;; auto-complete seems slow, check if company mode is conflicting
;;; Code:


(use-package haskell-mode
  :ensure t
  :bind (:map haskell-mode-map
	      ("C-c h" . hoogle)
	      ("C-o" . open-line))
  ;; this hook causes an infinite loop
  ;; :hook (haskell-mode (turn-on-haskell-indentation
  ;; 		       haskell-auto-insert-module-template))
  :mode (("\\.[gh]s\\'" . haskell-mode)
	 ;; the default is ghci-script-mode;
	 ;; not sure what advantage haskell-mode in .ghci is
	 ("\\.ghci\\'" . haskell-mode)
	 ("\\.l[gh]s\\'" . literate-haskell-mode)
	 ("\\.hsc\\'" . haskell-mode))
  )

;; (use-package haskell-cabal
;;   :after (haskell-mode
;;           company)
;;   :bind (:map haskell-cabal-mode ("C-c C-c" . haskell-compile))
;; )

;; cannot be found
;; (use-package haskell-doc
;;   :after haskell-mode)

(use-package hindent
  :ensure t
  :after haskell-mode
  :config
  (setq hindent-reformat-buffer-on-save t)
  :hook (haskell-mode . hindent-mode)
  )

;; ;; intero for full IDE features, though it is failing to autoload
;; (use-package intero
;;   :ensure t
;;   :after (haskell-mode)
;; 	  ;; haskell-cabal) ;; don't use this right now
;;   :hook
;;   (haskell-mode . (intero-global-mode
;; 		   subword mode
;; 		   eldoc-mode))
;;   ;;  is this redundant?
;;   ;; (haskell-cabal-mode . subword-mode)
;;   ;; cabal mode not working?
;;   ;; :bind (:map haskell-cabal-mode ("C-c C-l" . intero-restart))
;;   )

(use-package page-break-lines
  :ensure t
  :after haskell-mode
  :config
  (push 'haskell-mode page-break-lines-modes)
  )

;; ;; stack stuff can cause emacs to hang for a long time if it's not set up right
;; (define-minor-mode stack-exec-path-mode
;;   "If this is a stack project, set `exec-path' to the path \"stack exec\" would use."
;;   nil
;;   :lighter ""
;;   :global nil
;;   (if stack-exec-path-mode
;;       (when (and (executable-find "stack")
;; 		 (locate-dominating-file default-directory "stack.yaml"))
;; 	(setq-local
;; 	 exec-path
;; 	 (seq-uniq
;; 	  (append (list (concat (string-trim-right (shell-command-to-string "stack path --local-install-root")) "/bin"))
;; 		  (parse-colon-path
;; 		   (replace-regexp-in-string "[\r\n]+\\'" ""
;; 					     (shell-command-to-string "stack path --bin-path"))))
;; 	  'string-equal))
;; 					;(add-to-list (make-local-variable 'process-environment) (format "PATH=%s" (string-join exec-path path-separator)))
;; 	)
;;     (kill-local-variable 'exec-path)))

;; (add-hook 'haskell-mode-hook 'stack-exec-path-mode)

(provide 'init-haskell)
;;; init-haskell.el ends here
