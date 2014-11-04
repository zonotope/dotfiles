(add-hook 'ruby-mode-hook
          (lambda ()
            (require 'ruby-tools)
            (ruby-tools-mode 1)))
