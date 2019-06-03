;;; init-profile.el --- Performance and profiling
;;; Commentary:
;;; This code can be left out of the init if tinkering ever stops.
;;; Code:

;; run (M-x esup) to run the profiler
(use-package esup
  :init (require-package 'esup)
  )

;; Use a hook so the message doesn't get clobbered by other messages.
(add-hook 'emacs-startup-hook
          (lambda ()
            (message "Emacs ready in %s with %d garbage collections."
                     (format "%.2f seconds"
                             (float-time
                              (time-subtract after-init-time before-init-time)))
                     gcs-done)))

(provide 'init-profile)
;;; init-profile.el ends here
