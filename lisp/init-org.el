;;; init-org.el --- activate org mode
;;; Commentary:
;;; enables org mode in .org files
;;; Code:

(require 'org)
;; set some other global key bindings for use outside of org mode
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-switchb)
(setq org-log-done t)

(provide 'init-org)
;;; init-org.el ends here
