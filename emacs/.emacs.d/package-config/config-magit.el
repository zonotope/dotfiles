(require 'magit)
;; i don't need to be alerted that magit auto revert is running in every buffer
;; from a git project
(require 'diminish)
(diminish 'magit-auto-revert-mode)

;; don't show me 1.4 upgrade warnings
(setq magit-last-seen-setup-instructions "1.4.0")
