;;; init-elpa.el --- package management
;;; Commentary:
;;; Code:

(require 'package)

;; there are fancier versions of these functions in purcell's example
;; that allow version requirements
(defun require-package (package)
  "Install given PACKAGE if it was not installed before."
  (if (package-installed-p package)
      t
    (progn
      (unless (assoc package package-archive-contents)
	(package-refresh-contents))
      (package-install package))))

(defun maybe-require-package (package)
 "Try to install given PACKAGE and if unsuccessful return nil and print a warning message."
 (condition-case err
     (require-package package)
   (error
    (message "Could't install optional package `%s': %S" package err)
    nil)))

;; some packages like flycheck-rust are not in MELPA Stable
;; when changing this, probably need to run package-refresh-contents
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)
	     ;; '("melpa-stable" . "https://stable.melpa.org/packages/") t)


(package-initialize)

;; this line is required to avoid errors in byte-compilation.
;; use-package should probably require this itself.
(require-package 'bind-key)
(require 'bind-key)

;; TODO: we should replace remaining uses of above functions with use-pacakge
;; macro for simple configuration
(require-package 'use-package)
(setq use-package-always-ensure t)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(provide 'init-elpa)
;;; init-elpa.el ends here
