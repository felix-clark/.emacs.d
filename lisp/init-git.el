;;; init-git.el --- git functionality
;;; Commentary:
;;; Magit handles most git stuff
;;; Code:

(require 'init-elpa)

(when (version<= "25" emacs-version)
  (use-package magit
    :init (require-package 'magit)
    :defer t
    :config
    ;; for ido compatibility
    (setq magit-completing-read-function 'magit-ivy-completing-read)
    :after (ivy)
    ;; Magit invokes ARev mode, which we don't need to be reminded of.
    :diminish (auto-revert-mode)
    ;; bind shortcut to git-mode
    :bind ("C-x g" . magit-status)
    )
  )

(provide 'init-git)
;;; init-git.el ends here
