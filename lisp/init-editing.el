;;; init-editing.el --- text editing
;;; Commentary:
;;; Code:
(require 'init-elpa)

;; always highlight complementary delimiters with zero delay
(setq show-paren-delay 0)
(show-paren-mode 1)

;; always show column number (line-number-mode is on by default)
(setq column-number-mode t)

;; always disable tabs
(setq-default indent-tabs-mode nil)

;; Increase the default paragraph width for M-q
(setq-default fill-column 80)

(use-package ws-butler
  :ensure t
  :config (ws-butler-global-mode)
  ;; to only turn it on in programming mode, do something like:
  ;; :hook (prog-mode . ws-butler-mode)
  :diminish
  )

;; expand selection to semantic region naturally
;; C-= to expand; C-- to undo.
(use-package expand-region
  :ensure t
  :bind (("C-=" . er/expand-region)
	 ("C--" . er/contract-region))
  )

;; Original idea from
;; http://www.opensubscriber.com/message/emacs-devel@gnu.org/10971693.html
(defun comment-dwim-line (&optional arg)
  "Replacement for the comment-dwim command.
        If no region is selected and current line is not blank and we are not at the end of the line,
        then comment current line.
        Replaces default behaviour of comment-dwim, when it inserts comment at the end of the line."
  (interactive "*P")
  (comment-normalize-vars)
  (if (and (not (region-active-p)) (not (looking-at "[ \t]*$")))
      (comment-or-uncomment-region (line-beginning-position) (line-end-position))
    (comment-dwim arg)))
(global-set-key (kbd "M-;") 'comment-dwim-line)
;; see emacs wiki on "CommentingCode" for alternative that comments full lines containing region a la eclipse

;; enable changing region to upper and lower case
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

;; set flyspell for spellcheck on by default
(use-package flyspell
  :diminish
  :hook
  ((text-mode . flyspell-mode)
   (prog-mode . flyspell-prog-mode))
  )
;; ivy interface for flyspell corrections
(use-package flyspell-correct-ivy
  :ensure t
  :requires (ivy flyspell)
  :init
  (setq flyspell-correct-interface #'flyspell-correct-ivy)
  :bind
  ((:map flyspell-mode-map
	 ("C-;" . flyspell-correct-wrapper)))
  )

;; return to last place you were in when the file was opened
;; saved in ~/.emacs.d/places/, or ~/.emacs-places in older versions.
;; in emacs 25 I won't need to (require 'saveplace)
;; (require 'saveplace)
;; (setq-default save-place t)
;; (setq save-place-file (concat user-emacs-directory "places"))
;; if slow to exit, try adding (setq save-place-forget-unreadable-files nil)
(unless (version< emacs-version "25")
  (save-place-mode 1))

;; different coloring of successive delimiter levels
(use-package rainbow-delimiters
  :ensure t
  :hook (prog-mode . rainbow-delimiters-mode)
 )

;; automatically insert closing delimiters
;; TODO: disable in minibuffer
(use-package electric
  :config (electric-pair-mode t)
 )

(provide 'init-editing)
;;; init-editing.el ends here
