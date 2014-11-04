(require 'find-things-fast)

;; i want to search through all the files. all of them!
(setq ftf-filetypes '("*.*"))

;; "C-x C-/" to grep project
(global-set-key (kbd "C-x C-/") 'ftf-grepsource)
