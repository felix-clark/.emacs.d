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

;; always allow y or n response to yes/no prompt
(fset 'yes-or-no-p 'y-or-n-p)

;; lets us label modes as silent
(use-package diminish
  :init (require-package 'diminish))

;; smooth scrolling
(use-package smooth-scrolling
  :init
  (require-package 'smooth-scrolling)
  :config
  (smooth-scrolling-mode)
  (setq smooth-scroll-margin 8) ; default is 10
  )

;; start in fullscreen mode
;; use frame-fullscreen to remove Ubuntu menu bar as well
;; (toggle-full-screen)
;; (toggle-frame-fullscreen)

;; make the window with the cursor larger
(use-package golden-ratio
  :init
  (require-package 'golden-ratio)
  (golden-ratio-mode)
  :diminish
  :config
  ;; Encourage splitting horizontally a bit.
  ;; These are not golden-ratio variables but the functionality is intertwined.
  ;; The default for split-width-threshold is 160.
  (setq split-width-threshold 120)
  ;; The default for split-height-threshold is 80.
  (setq split-height-threshold 100)
  )

(use-package which-key
  :init
  (require-package 'which-key)
  (which-key-mode)
  :diminish
  )

;; eldoc for function signature description
(use-package eldoc
  :init (require 'eldoc)
  :diminish)

;; Setting themes
;; when multiple themes are loaded then one can simply
;; be enabled: (enable-theme 'my-theme)
;; I'll probably stick to one theme, though, so there's
;; not much point in actually loading multiple.

;; solarized comes with nice-looking light and dark themes
;; (require-package 'solarized-theme)
;; see github for solarized options, they go before load-theme
;; (load-theme 'solarized-dark-theme)
;; (load-theme 'solarized-light-theme)

;; zenburn is a popular vi theme
(use-package zenburn-theme
  :init
  (require-package 'zenburn-theme)
  (load-theme 'zenburn t) ;; not sure what passing "true" here does
  )

;; reduce the default font size
(set-face-attribute 'default (selected-frame) :height 110)

(provide 'init-ui)
;;; init-ui.el ends here
