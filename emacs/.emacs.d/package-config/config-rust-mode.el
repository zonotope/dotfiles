(autoload 'ruby-mode "rust-mode" nil t)

;; check spelling in comments
(add-hook 'rust-mode-hook 'flyspell-prog-mode)

(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))
