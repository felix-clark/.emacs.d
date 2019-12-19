;;; init-navigation.el --- utility for browsing and searching
;;; Commentary:
;;; Code:
(require 'init-elpa)

;; recentf to use <up> to browse recent files
(use-package recentf
  :ensure t
  ;; load after 1 second of idle time
  :defer 1
  :diminish
  :config
  (recentf-mode)
  (setq recentf-save-file (concat user-emacs-directory ".recentf"))
  (setq recentf-max-menu-items 40)
  )

;; try ivy over ido
;; note: ivy uses S-SPC instead of C-SPC to restrict within matches
;; fuzzy matching can be activated with ivy--regex-fuzzy, but let's keep that off for now.
(use-package ivy
  :ensure t
  :diminish
  :config
  (ivy-mode)
  (setq ivy-use-virtual-buffers t) ; possibly needed for recentf
  (setq ivy-height 13) ;; optional; default is 10
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
  :diminish
  :init
  ;; overrides many common key bindings (like find-file). must be in init, not
  ;; config block.
  (counsel-mode)
  :bind
  (
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
  ;; remove initial "^" in minibuffer
  (setcdr (assoc 'counsel-M-x ivy-initial-inputs-alist) "")
  ;; (setq ivy-initial-inputs-alist nil) ;; this removes "^" in all ivy commands
  )

;; use ibuffer interface for switching buffers to override list-buffers
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; projectile is only supported for version 25.1 and later
(when (version<= "25.1" emacs-version)
  ;; better sorting of completion results
  (use-package prescient
    :ensure t
    ;; save usage statistics between sessions
    :config (prescient-persist-mode)
    )

  (use-package ivy-prescient
    :ensure t
    :requires (ivy prescient)
    :after (counsel)
    :config (ivy-prescient-mode t)
    )

  (use-package projectile
    :ensure t
    :init
    ;; use projectile mode in standard commands instead of setting separate bindings
    ;; this can cause some issues, e.g. https://github.com/bbatsov/projectile/issues/994
    ;; This setting must be in init, not config.
    (projectile-mode t)
    :diminish
    :bind-keymap ("C-c p" . projectile-command-map)
    :config
    (setq projectile-completion-system 'ivy)
    :after (ivy)
    )

  (use-package counsel-projectile
    :ensure t
    :requires (counsel projectile)
    :config
    (counsel-projectile-mode t)
    ;; counsel does something to find-file.
    ;; we don't want to start projectile while not in a project, though.
    ;; :bind ("C-x C-f" . counsel-projectile-find-file)
    )

  (use-package ibuffer-projectile
    :ensure t
    :requires (projectile)
    )
  
  ) ; when (version<= 25.1 emacs-version)


;; amx is an active fork of smex for improved M-x utility
;; it automatically detects if ido or ivy is setup and if so it uses that back-end
;; it has a sensible default for save items
;; it's unclear how much it conflicts or works within counsel-M-x
;; amx should enable recent history
(use-package amx
  :ensure t
  :after (ivy) ; load after ivy so it is recognized
  :config (amx-mode t)
  ;; set one or both of these to nil to reduce a bit of delay
  ;; (setq 'amx-ignored-command-matchers nil)
  ;; (setq 'amx-show-key-bindings nil)
  )

(provide 'init-navigation)
;;; init-navigation.el ends here
