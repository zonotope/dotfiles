(require 'magit)

;; i don't need to be alerted that magit auto revert is running in every buffer
;; from a git project
(require 'diminish)
(diminish 'magit-auto-revert-mode)
