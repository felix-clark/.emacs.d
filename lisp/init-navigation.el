;;; init-navigation.el --- utility for browsing and searching
;;; Commentary:
;;; Code:
(require 'init-elpa)

;; recentf to use <up> to browse recent files
(use-package recentf
  :init
  (recentf-mode)
  :config
  (setq recentf-save-file (concat user-emacs-directory ".recentf"))
  (setq recentf-max-menu-items 40)
  )

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

;; try ivy over ido
(use-package ivy
  :ensure t
  :init (ivy-mode)
  :config
  (setq ivy-use-virtual-buffers t) ; possibly needed for recentf
  (setq ivy-height 20) ;; optional
  (setq ivy-count-format "(%d/%d) ")
  :bind
  (("C-c C-r" . ivy-resume)
   ("<f6>" . ivy-resume))
  )
;; (setq enable-recursive-minibuffers t) ;; suggested on github but not manual, actually might be causing some annoying behavior
(use-package swiper
  :bind ("C-s" . swiper)
  )

(use-package counsel
  :ensure t
  :init
  ;; overrides many common key bindings (like find-file)
  (counsel-mode)
  :bind (
	 ("<f2> u" . counsel-unicode-char)
	 ;; find file in git repo:
	 ("C-c g" . counsel-git)
	 ;; grep within repo:
	 ("C-c j" . counsel-git-grep)
	 ("C-c k" . counsel-ag) ; we don't have ag installed now?
	 ("C-x l" . counsel-locate)
	 ("C-S-o" . counsel-rhythmbox)
	 )
  :config
  (define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)
  )


;; use ibuffer interface for switching buffers to override list-buffers
(global-set-key (kbd "C-x C-b") 'ibuffer)

(use-package projectile
  :init
  ;; use projectile mode in standard commands instead of setting separate bindings
  ;; this can cause some issues, e.g. https://github.com/bbatsov/projectile/issues/994
  (projectile-mode)
  :config
  ;; use ivy with projectile
  (setq projectile-completion-system 'ivy)
  :after (ivy)
  )

(use-package counsel-projectile
  :init
  (counsel-projectile-mode)
  :after (counsel projectile)
  )

(use-package ibuffer-projectile)
  

;; amx is an active fork of smex for improved M-x utility
;; it automatically detects if ido or ivy is setup and if so it uses that backend
;; it has a sensible default for save items
(use-package amx
  :init
  (amx-mode)
  ;; :config
  ;; set one or both of these to nil to reduce a bit of delay
  ;; (setq 'amx-ignored-command-matchers nil)
  ;; (setq 'amx-show-key-bindings nil)
  :after (ivy) ; load after ivy so it is recognized
  )

(provide 'init-navigation)
;;; init-navigation.el ends here
