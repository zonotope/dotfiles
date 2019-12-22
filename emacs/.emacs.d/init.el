;;; init.el --- the base of 732's emacs configuration

;;; Commentary:
;; All the actual configuration is in config.org. It's loaded here with
;; org-babel.

;;; Code:
(org-babel-load-file "~/.emacs.d/config.org")

;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files
   (quote
    ("~/docs/org/life.org" "/home/zonotope/docs/org/blog.org" "/home/zonotope/docs/org/daily.org" "/home/zonotope/docs/org/fitness.org" "/home/zonotope/docs/org/inbox.org" "/home/zonotope/docs/org/programming.org" "/home/zonotope/docs/org/work/qc.org")))
 '(package-selected-packages
   (quote
    (web-mode tide org-pomodoro company-lsp lsp-ui slime-company slime ox-hugo-auto-export yaml-mode writegood-mode wordnut which-key wgrep-ag use-package typescript-mode toml-mode terraform-mode systemd synosaurus switch-window stumpwm-mode smex smartparens ruby-tools rg racer protobuf-mode php-mode ox-hugo mwim magit lua-mode lsp-go json-mode js2-mode ido-vertical-mode ido-completing-read+ handlebars-mode go-stacktracer go-playground go-guru go-eldoc go-dlv flymake-rust flycheck-rust flycheck-inline flx-ido find-file-in-project exec-path-from-shell edit-server-htmlize dockerfile-mode diminish delight csv-mode crux counsel company-go cider cargo base16-theme avy))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
