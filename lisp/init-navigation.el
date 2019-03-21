;;; init-navigation.el --- utility for browsing and searching
;;; Commentary:
;;; Code:
(require 'init-elpa)

;; recentf to use <up> to browse recent files
(require 'recentf)
(setq recentf-save-file (concat user-emacs-directory ".recentf"))
(recentf-mode 1)
(setq recentf-max-menu-items 40)

;; ;; ido: interactive do. try ivy instead.
;; (require 'ido)
;; ;; turn on ido mode
;; (ido-mode t)
;; ;; use it in more places
;; (ido-everywhere t)
;; ;; use flexible matching for extreme laziness
;; (setq ido-enable-flex-matching t)
;; ;; uncomment this to ignore hints at point in file
;; ;; it's probably mostly a problem in .html, where the </tag> syntax looks like a directory.
;; ;; (setq ido-use-filename-at-point nil)
;; ;; this apparently makes it easier to create a new file when ido "finds" something
;; (setq ido-auto-merge-work-directories-length -1)
;; ;; plays better with recentf
;; (setq ido-use-virtual-buffers t)
;; ;; really use ido everywhere: ubiquitous mode
;; (require-package 'ido-completing-read+)
;; (ido-ubiquitous-mode 1)

; try ivy over ido
(require-package 'ivy)
;; turn it on
(ivy-mode 1)
;; use recommended beginner configuration
(setq ivy-use-virtual-buffers t) ; possibly needed for recentf
(setq ivy-count-format "(%d/%d) ")
(setq enable-recursive-minibuffers t) ;; suggested on github but not manual
;; github suggestions
(require-package 'swiper)
(global-set-key (kbd "\C-s") 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
;; having trouble with counsel: ivy-make-magic-action is void?
(require-package 'counsel)
(counsel-mode) ;; enable several basic overrides
(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
;; find file in git repo:
(global-set-key (kbd "C-c g") 'counsel-git)
;; grep within repo:
(global-set-key (kbd "C-c j") 'counsel-git-grep)
(global-set-key (kbd "C-c k") 'counsel-ag) ; we don't have ag installed now?
(global-set-key (kbd "C-x l") 'counsel-locate)
(global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
(define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)
(global-set-key (kbd "C-c C-r") 'ivy-resume)


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
  ;; this can cause some issues, e.g. https://github.com/bbatsov/projectile/issues/994
  (add-hook 'after-init-hook 'projectile-global-mode)
  (setq projectile-completion-system 'ivy)
  (when (maybe-require-package 'counsel-projectile)
    (setq counsel-projectile-mode t))
  (maybe-require-package 'ibuffer-projectile)
  (setq projectile-completion-system 'ivy))

;; amx is an active fork of smex for improved M-x utility
;; it automatically detects if ido or ivy is setup and if so it uses that backend
;; it has a sensible default for save items
(require-package 'amx)
(amx-mode)
;; set one or both of these to nil to reduce a bit of delay
;; (setq 'amx-ignored-command-matchers nil)
;; (setq 'amx-show-key-bindings nil)


(provide 'init-navigation)
;;; init-navigation.el ends here
