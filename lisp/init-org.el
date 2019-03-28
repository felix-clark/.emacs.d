;;; init-org.el --- activate org mode
;;; Commentary:
;;; enables org mode in .org files
;;; Code:

(require 'org)
;; set some other global key bindings for use outside of org mode
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c b") 'org-switchb)
(setq org-log-done t)

;; turn on line wrapping and indentation, which for some reason is disabled by default.
(add-hook 'org-mode-hook '(lambda ()
                            (visual-line-mode)
                            (org-indent-mode)))

(provide 'init-org)
;;; init-org.el ends here
