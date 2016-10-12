;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; set up packages                                                          ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")
                         ("tromey" . "http://tromey.com/elpa/")))
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; install use-package                                                      ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

;; always install the package if it doesn't exist
(setq use-package-always-ensure t)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; interface/navigation                                                     ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; avy: navigate through buffers
(use-package avy
  :bind (("C-j" . avy-goto-char)
         ("C-c SPC" . avy-goto-char))

  :config (progn
            ;; use all letters for jump sequences
            (setq avy-keys (append (number-sequence ?a ?z)
                                   (number-sequence ?\, ?\/)
                                   '(?\; ?\[ ?\] )))

            ;; show only one character from the sequence at a time
            (setq avy-style 'at)

            ;; dim the background
            (setq avy-background t)

            ;; use cyan as the highlighted character color
            (set-face-attribute 'avy-lead-face nil
                                :foreground "cyan"
                                :background nil)))


;; ag: the silver searcher. grep/ack but better and faster
(use-package ag
  :bind (("C-x C-/" . ag-project)
         ("C-c /" . ag-project-regexp))
  :config (progn
            (setq ag-reuse-window 't)))

;; company: complete anything
(use-package company
  :config (global-company-mode))

;; crux: a collection of ridiculously useful extensions
(use-package crux
  :bind (("C-c n" . crux-cleanup-buffer-or-region)
         ("C-x 4 t" . crux-transpose-windows)
         ("C-c D" . crux-delete-file-and-buffer)
         ("C-c r" . crux-rename-file-and-buffer)
         ("M-;" . comment-or-uncomment-region))
  :config (progn
            (crux-with-region-or-buffer indent-region)
            (crux-with-region-or-line comment-or-uncomment-region)))

;; dired-details: clean up dired
(use-package dired-details
  :config (progn
            (setq-default dired-details-hidden-string "--- ")
            (dired-details-install)))

;; magit: emacs git interface
(use-package magit
  :config (setq magit-builtin-completing-read-function
                'magit-ido-completing-read)
  :bind ("C-x g" . magit-status))

;; toggle start, or toggle end, of the line and text
(use-package mwim
  :bind (("C-a" . mwim-beginning-of-code-or-line)
         ("C-e" . mwim-end-of-code-or-line)))

;; smartparens: structural navigation, delimiter matching, and highlighting
(use-package smartparens
  :bind (:map sp-keymap
              ("C-c s" . sp-slurp-hybrid-sexp)
              ("C-M-f" . sp-forward-sexp)
              ("C-M-b" . sp-backward-sexp)

              ("C-M-d" . sp-down-sexp)
              ("C-M-a" . sp-backward-down-sexp)
              ("C-S-a" . sp-beginning-of-sexp)
              ("C-S-d" . sp-end-of-sexp)

              ("C-M-e" . sp-up-sexp)
              ("C-M-u" . sp-backward-up-sexp)
              ("C-M-t" . sp-transpose-sexp)

              ("C-M-n" . sp-next-sexp)
              ("C-M-p" . sp-previous-sexp)

              ("C-M-k" . sp-kill-sexp)
              ("C-M-w" . sp-copy-sexp)

              ("M-<delete>" . sp-unwrap-sexp)
              ("M-<backspace>" . sp-backward-unwrap-sexp)

              ("C-<right>" . sp-forward-slurp-sexp)
              ("C-<left>" . sp-forward-barf-sexp)
              ("C-M-<left>" . sp-backward-slurp-sexp)
              ("C-M-<right>" . sp-backward-barf-sexp)

              ("M-D" . sp-splice-sexp)
              ("C-M-<delete>" . sp-splice-sexp-killing-forward)
              ("C-M-<backspace>" . sp-splice-sexp-killing-backward)
              ("C-S-<backspace>" . sp-splice-sexp-killing-around)

              ("C-]" . sp-select-next-thing-exchange)
              ("C-<left_bracket>" . sp-select-previous-thing)
              ("C-M-]" . sp-select-next-thing)

              ("M-F" . sp-forward-symbol)
              ("M-B" . sp-backward-symbol)

              ("H-t" . sp-prefix-tag-object)
              ("H-p" . sp-prefix-pair-object)
              ("H-s c" . sp-convolute-sexp)
              ("H-s a" . sp-absorb-sexp)
              ("H-s e" . sp-emit-sexp)
              ("H-s p" . sp-add-to-previous-sexp)
              ("H-s n" . sp-add-to-next-sexp)
              ("H-s j" . sp-join-sexp)
              ("H-s s" . sp-split-sexp))

  :init (progn
          ;; smartparens everywhere
          (smartparens-global-mode 1)

          ;; highlight matching delimiters
          (show-smartparens-global-mode 1)

          ;; works shitily with this turned on
          (setq blink-matching-paren nil)

          ;; looks a lil better with tomorrow night eighties
          (set-face-attribute 'sp-show-pair-match-face nil
                              :inherit nil
                              :background "darkslategrey")

          ;; enable the default config
          (require 'smartparens-config)))


;; switch-window: visually switch windows
(use-package switch-window
  :bind ("C-x o" . switch-window))


;; find-things-fast: find things, fast
(use-package find-things-fast
  :bind (("C-c f" . ftf-find-file))   ; "C-c f" to find file in project

  :config (progn
            ;; i want to search through all the files. all of them!
            (setq ftf-filetypes '("*.*"))))

;; flx-ido: better flex matching for ido
(use-package flx-ido
  :config (progn
            (flx-ido-mode 1)

            ;; disable ido faces to see flx highlights.
            (setq ido-use-faces nil)))


;; ido-ubiquitous-mode; really use ido everywhere
(use-package ido-ubiquitous
  :config (ido-ubiquitous-mode 1))


;; ido-vertical-mode: list ido matches vertically
(use-package ido-vertical-mode
  :config (progn (ido-vertical-mode 1)
                 (setq ido-vertical-define-keys 'C-n-and-C-p-up-and-down)))

;; wgrep-ag: writable ag buffers, and apply changes to matches in files
(use-package wgrep-ag)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; edit chrome text areas                                                   ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package edit-server
  :config (setq edit-server-new-frame nil))

(use-package edit-server-htmlize
  :config (progn
            (add-hook 'edit-server-start-hook
                      'edit-server-maybe-dehtmlize-buffer)

            (add-hook 'edit-server-done-hook
                      'edit-server-maybe-htmlize-buffer)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; clojure                                                                  ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package clojure-mode
  :config (define-clojure-indent
            ;; compojure
            (defroutes 'defun)
            (GET 2)
            (POST 2)
            (PUT 2)
            (DELETE 2)
            (HEAD 2)
            (ANY 2)
            (context 2)

            ;; core.match
            (match 1))

  :mode (("\\.clj\\'" . clojure-mode)
         ("\\.cljc\\'" . clojure-mode)
         ("\\.cljs\\'" . clojure-mode)
         ("\\.edn\\'" . clojure-mode)))

;; clojure(script) ide and repl
(use-package cider
  :config (progn
            (setq cider-repl-use-pretty-printing t)
            (setq cider-repl-use-clojure-font-lock t)

            ;; whitelist reloaded.repl and duct functions for cider
            (add-to-list 'safe-local-variable-values
                         '(cider-cljs-lein-repl
                           . "(do (dev) (go) (cljs-repl))"))

            (add-to-list 'safe-local-variable-values
                         '(cider-refresh-after-fn . "reloaded.repl/resume"))

            (add-to-list 'safe-local-variable-values
                         '(cider-refresh-before-fn . "reloaded.repl/suspend"))))

(use-package pixie-mode)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; css                                                                      ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package css-mode
  :mode (("\\.css\\'" . css-mode)
         ("\\.scss\\'" . css-mode)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; cucumber features                                                        ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package feature-mode)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; json                                                                     ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package json-mode
  :config (setq js-indent-level 2))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; markdown                                                                 ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package markdown-mode
  :config (progn
            ;; automatically enable auto fill mode
            (add-hook 'markdown-mode-hook
                      (lambda ()
                        (auto-fill-mode 1))))

  :mode ("\\.md\\'" . markdown-mode))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; php                                                                      ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package php-mode)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ruby                                                                     ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package ruby-mode
  :bind (:map ruby-mode-map
              ("C-M-h" . backward-kill-word))

  :config (progn
            (setq ruby-deep-arglist t)
            (setq ruby-deep-indent-paren nil)
            (setq c-tab-always-indent nil))

  :mode (("Berksfile\\'" . ruby-mode)
         ("Capfile\\'" . ruby-mode)
         ("Gemfile\\'" . ruby-mode)
         ("Rakefile\\'" . ruby-mode)
         ("\\.rake\\'" . ruby-mode)
         ("\\.rb\\'" . ruby-mode)
         ("\\.ru\\'" . ruby-mode)
         ("\\.gemspec\\'" . ruby-mode)))


;;; extras for ruby mode
(use-package ruby-tools
  :config (add-hook 'ruby-mode-hook
                    (lambda ()
                      (require 'ruby-tools)
                      (ruby-tools-mode 1))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; rust                                                                     ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package rust-mode
  :mode ("\\.rs\\'" . rust-mode))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; slim                                                                     ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package slim-mode)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; toml                                                                     ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package toml-mode
  :mode ("\\.toml\\'" . toml-mode))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; yaml                                                                     ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package yaml-mode
  :mode (("\\.yml\\'" . yaml-mode)
         ("\\.yaml\\'" . yaml-mode)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; make this package config loadable                                        ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'packages)
