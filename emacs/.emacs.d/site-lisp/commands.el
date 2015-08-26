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

(provide 'commands)
