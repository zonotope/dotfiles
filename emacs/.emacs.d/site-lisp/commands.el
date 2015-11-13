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


;;; comment or uncomment region as normal, unless no region is selected,
;;; then comment the current line
(defun comment-or-uncomment-region-or-line ()
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

;;;; set bindings that can't be overridden by nodes
;;; set bindings that shouldn't be overridden using a minor mode and keymap
(defvar permanent-bindings-mode-map
  (make-keymap) "permanent-bindings-mode keymap.")

(define-minor-mode permanent-bindings-mode
  "A minor mode so that my key settings override annoying major modes."
  t " permanent-bindings" 'permanent-bindings-mode-map)

(permanent-bindings-mode 1)

;;; hide the permanent-bindings-mode from the keymap
(require 'diminish)
(diminish 'permanent-bindings-mode)

(defun set-permanent-key (key function-name)
  (define-key permanent-bindings-mode-map key function-name))

;;; set the exec path to the same one used by the shell because mac osx sucks
(defun set-exec-path-from-shell-PATH ()
  (interactive)
  (let ((path-from-shell (replace-regexp-in-string "[ \t\n]*$" ""
                                                   (shell-command-to-string "$SHELL --login -i -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))

;;; evaluate body after feature is loaded
(defmacro after-load (feature &rest body)
  (declare (indent defun))
  `(eval-after-load ,feature
     '(progn ,@body)))

;;; draw a comment box that stretches at least to the fill line.
(defun wide-comment-box (b e)
  (interactive "r")
  (let ((e (copy-marker e t))
        (end-column (- fill-column 8))) ;; padding for a nicer looking "margin"
    (goto-char b)
    (end-of-line)
    (insert-char ?  (- end-column (current-column)))
    (comment-box b e 1)
    (goto-char e)
    (set-marker e nil)))

(provide 'commands)
