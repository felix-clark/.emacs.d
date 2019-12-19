;;; init-elpa.el --- package management
;;; Commentary:
;;; Code:

(require 'package)

;; required in emacs24 for cl-find-if in the macro below
(require 'cl-lib)

;; Use Purcell's definition of require-package. A simpler version fails to
;; refresh the package contents when the version is out-of-date, which
;; necessitates manual calling of package-refresh-contents.
(defun require-package (package &optional min-version no-refresh)
  "Install given PACKAGE, optionally requiring MIN-VERSION.
If NO-REFRESH is non-nil, the available package lists will not be
re-downloaded in order to locate PACKAGE."
  (or (package-installed-p package min-version)
      (let* ((known (cdr (assoc package package-archive-contents)))
             (versions (mapcar #'package-desc-version known)))
        (if (cl-find-if (lambda (v) (version-list-<= min-version v)) versions)
            (package-install package)
          (if no-refresh
              (error "No version of %s >= %S is available" package min-version)
            (package-refresh-contents)
	    (require-package package min-version t))))))

;; some packages like flycheck-rust are not in MELPA Stablel
;; manually run (package-refresh-contents) after changing this.
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)
	     ;; '("melpa-stable" . "https://stable.melpa.org/packages/") t)

(package-initialize)

;; this line is required to avoid errors in byte-compilation.
;; use-package should probably require this itself.
(require-package 'bind-key)
(require 'bind-key)

;; TODO: we should replace remaining uses of above functions with use-package
;; macro for simple configuration
(require-package 'use-package)
(setq use-package-always-ensure t)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; use-package can use either diminish or delight.
;; This must be called before using the :diminish keyword.
(use-package diminish
  :ensure t
  )


(use-package auto-package-update
  :ensure t
  :config
  ;; increase the update interval from 1 week to 2
  (setq auto-package-update-interval 14)
  (setq auto-package-update-prompt-before-update t)
  (setq auto-package-update-delete-old-versions t)
  (auto-package-update-maybe)
  )

(provide 'init-elpa)
;;; init-elpa.el ends here
