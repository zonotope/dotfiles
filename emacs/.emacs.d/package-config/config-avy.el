(require 'avy)

;; use all letters for jump sequences
(setq avy-keys (append (number-sequence ?a ?z)
                       (number-sequence ?\, ?\/)
                       '(?\; ?\[ ?\] )))

;; show only one character from the jump sequence at a time
(setq avy-style 'at)

;; dim the background
(setq avy-background t)

;; use cyan as the highlighted character color
(set-face-attribute 'avy-lead-face nil :foreground "#66cccc" :background nil)
