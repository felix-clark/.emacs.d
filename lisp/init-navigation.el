;;; init-navigation.el --- utility for browsing and searching
;;; Commentary:
;;; Code:

;; projectile for navigation within projects
(when (maybe-require-package 'projectile)
  (add-hook 'after-init-hook 'projectile-mode)
  ;; Shorter modeline
  (setq-default projectile-mode-line-prefix " Proj")
  (after-load 'projectile
    (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))
  (maybe-require-package 'ibuffer-projectile))
;; TODO: consider replacing default default bindings like "C-x C-f" with projectile versions

;; smex to improve M-x
(when (maybe-require-package 'smex)
  ;; Change path for ~/.smex-items
  (setq-default smex-save-file (expand-file-name ".smex-items" user-emacs-directory))
  (global-set-key [remap execute-extended-command] 'smex))

(provide 'init-navigation)
;;; init-navigation.el ends here
