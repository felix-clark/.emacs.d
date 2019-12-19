;;; init-csv.el --- for editing .csv files
;;; Commentary:
;;; Code:

(require 'init-elpa)
(use-package csv-mode
  :ensure t
  ;; :mode ("\\.[Cc][Ss][Vv]\\'" . csv-mode) ; redundant?
  :config
  ;; (add-auto-mode 'csv-mode "\\.[Cc][Ss][Vv]\\'")
  (setq csv-separators '("," ";" "|" " "))
  )

(provide 'init-csv)
;;; init-csv.el ends here
