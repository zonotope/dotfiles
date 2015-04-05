;; use for all js and json files, and node scripts
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . js2-mode))
(add-to-list 'interpreter-mode-alist '("node" . js2-mode))

;; make js2-mode respect my color theme
(setq js2-use-font-lock-faces t)

;; strict warnings are kind of annoying
(setq js2-mode-show-strict-warnings nil)

;; use 2 spaces
(setq-default js2-basic-offset 2)
