(autoload 'yaml-mode "yaml-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode))
(eval-after-load "yaml-mode"
  '(define-key yaml-mode-map "\C-m" 'newline-and-indent))
