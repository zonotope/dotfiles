(autoload 'ruby-electric-mode "ruby electric" nil t)

;; this function was removed from ruby-mode, so replaced here
(defun ruby-insert-end ()
  "Insert \"end\" at point and reindent current line."
  (interactive)
  (insert "end")
  (ruby-indent-line t)
  (end-of-line))

;; start up ruby electric when ruby starts
(add-hook 'ruby-mode-hook
          (lambda()
            (require 'ruby-electric)
            (ruby-electric-mode t)))
