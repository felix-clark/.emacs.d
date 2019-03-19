;;; init-git.el --- git functionality
;;; Commentary:
;;; Magit handles most git stuff
;;; Code:

(require 'init-elpa)

(require-package 'magit)
;; for ido compatibility
(setq magit-completing-read-function 'magit-ido-completing-read)

(provide 'init-git)
;;; init-git.el ends here
