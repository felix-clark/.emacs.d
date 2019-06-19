;;; init-completion.el --- for auto-completion
;;; Commentary:
;;; Company mode for completion framework with ya-snippet for code snippets.
;;; Code:
(require 'init-elpa)

(use-package yasnippet
  :init (require-package 'yasnippet)
  :defer t
  :diminish yas-minor-mode
  :config
  ;; without this the tables don't get loaded
  (yas-reload-all)
  ;; add a directory for extra snippets? this is done by default
  ;; (add-to-list 'yas-snippet-dirs (locate-user-emacs-file "snippets"))
  (yas-global-mode t)
  )

(use-package yasnippet-snippets
  :init (require-package 'yasnippet-snippets)
  :requires yasnippet
  )

(use-package company
  :ensure t
  :diminish company-mode
  ;; load after yasnippet so we can add it to the backends
  :after yasnippet
  :config
  (setq company-tooltip-align-annotations t
	company-minimum-prefix-length 2
	company-show-numbers t
	)
  (global-company-mode)
  ;; we could use C-[np] instead of M-[np] to move within company completion
  ;; menu, but this turns out to be annoying when one wants to simply move up or
  ;; down a line.
  ;; :bind (:map company-active-map
  ;; 	      ("M-n" . nil)
  ;; 	      ("M-p" . nil)
  ;; 	      ("C-n" . #'company-select-next)
  ;; 	      ("C-p" . #'company-select-previous))

  ;; add yasnippet to the backends
  (defvar company-mode/enable-yas t
    "Enable yasnippet for all backends.")
  (defun company-mode/backend-with-yas (backend)
    (if (or (not company-mode/enable-yas)
	    (and (listp backend)
		 (member 'company-yasnippet backend)))
	backend
      (append (if (consp backend) backend (list backend))
	      '(:with company-yasnippet))))
  ;; add the yas backend to all elements in the list of company backends
  (defun set-yas-as-company-backend ()
    (setq company-backends
	  (mapcar #'company-mode/backend-with-yas company-backends)))
  (add-hook 'company-mode-hook 'set-yas-as-company-backend)
  ;;  is this needed for yasnippet? not clear what it does
  (setq company-transformers '(company-sort-by-backend-importance))
  )

(use-package company-quickhelp
  :requires company
  :init
  (require-package 'company-quickhelp)
  :config
  (company-quickhelp-mode)
  )

(use-package company-prescient
  :init (require-package 'company-prescient)
  )

;; These may not really be part of company-mode
(setq tab-always-indent 'complete)
;; do we really want completion for initials and acronyms?
(add-to-list 'completion-styles 'initials t)

(provide 'init-completion)
;;; init-completion.el ends here
