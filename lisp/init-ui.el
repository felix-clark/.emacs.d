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

;; smooth scrolling
(use-package smooth-scrolling
  :ensure t
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
  :ensure t
  :diminish
  :config
  (golden-ratio-mode)
  ;; Encourage splitting horizontally a bit.
  ;; These are not golden-ratio variables but the functionality is intertwined.
  ;; The default for split-width-threshold is 160.
  (setq split-width-threshold 120)
  ;; The default for split-height-threshold is 80.
  (setq split-height-threshold 100)
  )

(use-package which-key
  :ensure t
  :diminish
  :config
  (which-key-mode)
  )

;; eldoc for function signature description
(use-package eldoc
  :init (require 'eldoc)
  :diminish
  )

;; zenburn is a popular vi theme
(use-package zenburn-theme
  :ensure t
  :config
  (load-theme 'zenburn t) ;; not sure what passing "true" here does
  )

;; reduce the default font size
(set-face-attribute 'default nil :height 110)

(provide 'init-ui)
;;; init-ui.el ends here
