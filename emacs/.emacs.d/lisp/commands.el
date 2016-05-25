(defun rename-current-buffer-file ()
  "Renames current buffer and file it is visiting."
  (interactive)
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not (and filename (file-exists-p filename)))
        (error "Buffer '%s' is not visiting a file!" name)
      (let ((new-name (read-file-name "New name: " filename)))
        (if (get-buffer new-name)
            (error "A buffer named '%s' already exists!" new-name)
          (rename-file filename new-name 1)
          (rename-buffer new-name)
          (set-visited-file-name new-name)
          (set-buffer-modified-p nil)
          (message "File '%s' successfully renamed to '%s'"
                   name (file-name-nondirectory new-name)))))))




(defun comment-or-uncomment-region-or-line ()
  "toggle comment for region, or current line if there's no active region."
  (interactive)
  (let ((start (line-beginning-position))
        (end (line-end-position)))
    (when (or (not transient-mark-mode) (region-active-p))
      (setq start (save-excursion
                    (goto-char (region-beginning))
                    (beginning-of-line)
                    (point))
            end (save-excursion
                  (goto-char (region-end))
                  (end-of-line)
                  (point))))
    (comment-or-uncomment-region start end)))


(defun set-exec-path-from-shell-PATH ()
  "set the exec path to the same one used by the shell because mac osx sucks"
  (interactive)
  (let ((path-from-shell (replace-regexp-in-string
                          "[ \t\n]*$" ""
                          (shell-command-to-string
                           "$SHELL --login -i -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))


(defun wide-comment-box (b e)
  "draw a comment box that stretches close to the fill line."
  (interactive "r")
  (let ((e (copy-marker e t))
        (end-column (- fill-column 8))) ;; padding for a nicer looking "margin"
    (goto-char b)
    (end-of-line)
    (insert-char ?  (- end-column (current-column)))
    (comment-box b e 1)
    (goto-char e)
    (set-marker e nil)))

(defun yank-and-indent ()
  "yank and then indent the newly formed region according to mode."
  (interactive)
  (yank)
  (call-interactively 'indent-region))

(provide 'commands)
