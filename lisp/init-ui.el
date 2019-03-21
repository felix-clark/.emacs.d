;;; init-ui.el --- setting up interface
;;; Commentary:
;;; This will require several themes so that I can easily switch in the future
;;; Code:

(require 'init-elpa)

;; open scratch buffer instead of welcome message
(setq inhibit-startup-message t)

;; disable the menu bar that we don't use in no-window mode anyway
;; this is the emacs built-in menu
(menu-bar-mode -1)

;; turn off the OS menu
(tool-bar-mode -1)

;; turn off the scrollbar
(scroll-bar-mode -1)

;; start in fullscreen mode
;; use frame-fullscreen to remove Ubuntu menu bar as well
;; (toggle-full-screen)
;; (toggle-frame-fullscreen)

;; make the window with the cursor larger
(use-package golden-ratio
  :init (golden-ratio-mode)
  )

(use-package which-key
  :init (which-key-mode)
  )


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
(use-package zenburn-theme
  :init (load-theme 'zenburn t) ;; not sure what passing "true" here does
  )


(provide 'init-ui)
;;; init-ui.el ends here
