(setq rinari-major-mode-hooks
      (list 'mumamo-after-change-major-mode-hook 'dired-mode-hook 'ruby-mode-hook
            'css-mode-hook 'yaml-mode-hook 'javascript-mode-hook))

  ;;(dolist (hook rinari-major-mode-hooks)
  ;; (add-hook hook 
  ;;           (lambda ()
  ;;             (require 'rinari)
  ;;             (rinari-mode 1))))
