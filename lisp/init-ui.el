(require 'init-elpa)

;; loading a custom theme would go here, but I use terminal themes now anyway

;; make the window with the cursor larger
(require-package 'golden-ratio)
(require 'golden-ratio)
(golden-ratio-mode 1)

;; open scratch buffer instead of welcome message
(setq inhibit-startup-message t)

;; disable the menu bar that we don't use in no-window mode anyway
(menu-bar-mode -1)

(provide 'init-ui)
