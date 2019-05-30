;;; init-git.el --- git functionality
;;; Commentary:
;;; Magit handles most git stuff
;;; Code:

(require 'init-elpa)

(when (version<= "25" emacs-version)
  (use-package magit
    :init (require-package 'magit)
    :config
    ;; for ido compatibility
    (setq magit-completing-read-function 'magit-ivy-completing-read)
    :after (ivy)
    )
  )

(provide 'init-git)
;;; init-git.el ends here
