;;; init-stats.el --- for R and julia
;;; Commentary:
;;; Code:
(require 'init-elpa)

(use-package julia-mode
  :ensure t
  :defer t
  )

(use-package ess
  :ensure t
  :defer t
  :config
  ;; Define the pipe operator, which does not have a shortcut in ESS.
  (defun then-R-operator ()
    "R: 'then' pipe operator %>%"
    (interactive)
    (just-one-space 1)
    (insert "%>%")
    (reindent-then-newline-and-indent))
  ;; Bind M-- to assignment operator as in Rstudio. This is typically bound to
  ;; negative-argument, but C-M-- is also bound to negative-argument.
  ;; C-S-m for the pipe operator, corresponding to the shortcut in Rstudio,
  ;; interferes with carriage return in interactive mode.
  ;; The "C->" shortcut works in an X-window session but not in no-window mode.
  ;; I can probably do most R coding locally, so this is probably fine. See:
  ;; https://emacs.stackexchange.com/questions/1020/problems-with-keybindings-when-using-terminal
  :bind (("M--" . ess-insert-assign)
         ("C->" . then-R-operator))
  ;; ess-set-style is not recognized for some reason.
  ;; :config (ess-set-style 'RStudio)
  )

(provide 'init-stats)
;;; init-stats.el ends here
