(require 'avy)

;; use all letters for jump sequences
(setq avy-keys (number-sequence ?a ?z))

;; show only one character from the jump sequence at a time
(setq avy-style 'at)

;; dim the background
(setq avy-background t)

(set-face-attribute 'avy-lead-face nil :foreground "green" :background nil)
(set-face-attribute 'avy-lead-face-0 nil :foreground "orange" :background nil)
(set-face-attribute 'avy-lead-face-1 nil :foreground "red" :background nil)
(set-face-attribute 'avy-lead-face-2 nil :foreground "yellow" :background nil)
