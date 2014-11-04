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

(provide 'pbinding)
