;;; init-ui.el --- setting up interface
;;; Commentary:
;;; This will require several themes so that I can easily switch in the future
;;; Code:

(require 'init-elpa)

;; make the window with the cursor larger
(require-package 'golden-ratio)
(require 'golden-ratio)
(golden-ratio-mode 1)

;; open scratch buffer instead of welcome message
(setq inhibit-startup-message t)

;; disable the menu bar that we don't use in no-window mode anyway
(menu-bar-mode -1)

;; Setting themes
;; when multiple themes are loaded then one can simply
;; be enabled: (enable-theme 'my-theme)
;; I'll probably stick to one theme, though, so there's
;; not much point in actually loading multiple.

;; solarized comes with nice-looking light and dark themes
(require-package 'solarized-theme)
;; see github for solarized options, they go before load-theme
;; (load-theme 'solarized-dark-theme)
;; (load-theme 'solarized-light-theme)

;; zenburn is a popular vi theme
(require-package 'zenburn-theme)
(load-theme 'zenburn t) ;; not sure what passing "true" here does

(provide 'init-ui)
;;; init-ui.el ends here
