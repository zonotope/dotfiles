(require 'markdown-mode)

(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(add-hook 'markdown-mode-hook
          (lambda ()
            (auto-fill-mode 1)))
            ;; need to setup ispell/aspell (flyspell-mode 1)))
