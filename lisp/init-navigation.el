;;; init-navigation.el --- utility for browsing and searching
;;; Commentary:
;;; Code:
(require 'init-elpa)

;; recentf to use <up> to browse recent files
(require 'recentf)
(setq recentf-save-file (concat user-emacs-directory ".recentf"))
(recentf-mode 1)
(setq recentf-max-menu-items 40)

;; ido: interactive do
(require 'ido)
;; turn on ido mode
(ido-mode t)
;; use it in more places
(ido-everywhere t)
;; use flexible matching for extreme laziness
(setq ido-enable-flex-matching t)
;; uncomment this to ignore hints at point in file
;; it's probably mostly a problem in .html, where the </tag> syntax looks like a directory.
;; (setq ido-use-filename-at-point nil)
;; this apparently makes it easier to create a new file when ido "finds" something
(setq ido-auto-merge-work-directories-length -1)
;; plays better with recentf
(setq ido-use-virtual-buffers t)
;; really use ido everywhere: ubiquitous mode
(require-package 'ido-completing-read+)
(ido-ubiquitous-mode 1)


;; use ibuffer interface for switching buffers to override list-buffers
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; projectile for navigation within projects
(when (maybe-require-package 'projectile)
  ;; (add-hook 'after-init-hook 'projectile-mode)
  ;; Shorter modeline
  ;; (setq-default projectile-mode-line-prefix " Proj")
  ;; (after-load 'projectile
  ;;   (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))
  ;; use projectile mode in standard commands instead of setting separate bindings
  (add-hook 'after-init-hook 'projectile-global-mode)
  (maybe-require-package 'ibuffer-projectile))

;; amx is an active fork of smex for improved M-x utility
;; it automatically detects if ido is setup and if so it uses that backend
;; it has a sensible default for save items
(require-package 'amx)
(amx-mode)

(provide 'init-navigation)
;;; init-navigation.el ends here
