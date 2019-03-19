;;; init-csv.el --- for editing .csv files
;;; Commentary:
;;; Code:

(require 'init-elpa)
(require-package 'csv-mode)

(add-auto-mode 'csv-mode "\\.[Cc][Ss][Vv]\\'")

(setq csv-separators '("," ";" "|" " "))

(provide 'init-csv)
;;; init-csv.el ends here
