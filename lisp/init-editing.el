;;; init-editing.el --- text editing
;;; Commentary:
;;; Code:
(require 'init-elpa)

;; always highlight complementary delimiters with zero delay
(setq show-paren-delay 0)
(show-paren-mode 1)

;; always show column number (line-number-mode is on by default)
(setq column-number-mode t)

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
(global-set-key "\M-;" 'comment-dwim-line)
;; see emacs wiki on "CommentingCode" for alternative that comments full lines containing region a la eclipse

;; set flyspell for spellcheck on by default
;; (require 'flyspell)
;; (add-hook 'text-mode-hook 'flyspell-mode)
;; (add-hook 'prog-mode-hook 'flyspell-prog-mode)
(use-package flyspell
  :hook
  ((text-mode . flyspell-mode)
   (prog-mode . flyspell-prog-mode))
  )

;; rebind comment line from "C-x C-;" to "C-;",
;; overriding flyspell-auto-correct-previous-word
;; this doesn't actually seem to override it, however.
;; (defun toggle-comment-on-line ()
;;   "Comment or uncomment current line."
;;   (interactive)
;;   (comment-or-uncomment-region (line-beginning-position) (line-end-position)))
;; (global-set-key (kbd "C-;") 'toggle-comment-on-line)

;; return to last place you were in when the file was opened
;; saved in ~/.emacs.d/places/, or ~/.emacs-places in older versions.
;; in emacs 25 I won't need to (require 'saveplace)
;; (require 'saveplace)
;; (setq-default save-place t)
;; (setq save-place-file (concat user-emacs-directory "places"))
;; if slow to exit, try adding (setq save-place-forget-unreadable-files nil)
(save-place-mode 1) ;; change all this to this single line with emacs 25

;; different coloring of successive delimiter levels
(require-package 'rainbow-delimiters)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; automatically insert closing delimiters
(require 'electric)
(add-hook 'prog-mode-hook (electric-pair-mode 1))

(provide 'init-editing)
;;; init-editing.el ends here
