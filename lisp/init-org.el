;;; init - org.el-- - activate org mode;
;;; Commentary:
;;; enables org mode in.org files
;;; Code:

(use-package org
  ;; turn on line wrapping and indentation, which for some reason is disabled by default.
  :hook (org-mode . (visual-line-mode
		     org-indent-mode))
  ;; set some other global key bindings for use outside of org mode
  ;; if they're global, should they be within the org-mode config?
  :bind (("C-c l" . org-store-link)
	 ("C-c a" . org-agenda)
	 ("C-c c" . org-capture)
	 ("C-c b" . 'org-switchb))
  :config (setq org-log-done t)
  )

(provide 'init-org)
;;; init-org.el ends here
