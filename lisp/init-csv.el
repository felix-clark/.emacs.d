;;; init-csv.el --- for editing .csv files
;;; Commentary:
;;; Code:

(require 'init-elpa)
(use-package csv-mode
  :init
  (require-package 'csv-mode)
  ;; :mode ("\\.[Cc][Ss][Vv]\\'" . csv-mode) ; redundant?
  :config
  ;; (add-auto-mode 'csv-mode "\\.[Cc][Ss][Vv]\\'")
  (setq csv-separators '("," ";" "|" " "))
  )

(provide 'init-csv)
;;; init-csv.el ends here
