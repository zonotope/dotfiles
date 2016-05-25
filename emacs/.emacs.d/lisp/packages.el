;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; set up elpa                                                              ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")
                         ("tromey" . "http://tromey.com/elpa/")))
(package-initialize)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; install use-package if it isn't already                                  ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(unless (package-installed-p 'use-package)
  (package-install 'use-package))


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


;; company: complete anything
(use-package company
  :config (global-company-mode))

;; dired-details: clean up dired
(use-package dired-details
  :config (progn
            (setq-default dired-details-hidden-string "--- ")
            (dired-details-install)))

;; magit: emacs git interface
(use-package magit
  :bind ("C-x g" . magit-status))

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
  :bind (;; "C-x C-/" to grep project
         ("C-x C-/" . ftf-grepsource)

         ;; "C-c f" to find file in project
         ("C-c f" . ftf-find-file))

  :config (progn
            ;; i want to search through all the files. all of them!
            (setq ftf-filetypes '("*.*"))))


;; flx-ido: better flex matching for ido
(use-package flx-ido
  :config (progn
            (flx-ido-mode 1)

            ;; disable ido faces to see flx highlights.
            (setq ido-use-faces nil)))


;; ido-vertical-mode: list ido matches vertically
(use-package ido-vertical-mode
  :config (progn (ido-vertical-mode 1)
                 (setq ido-vertical-define-keys 'C-n-and-C-p-up-and-down)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; clojure                                                                  ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package clojure-mode
  :config (define-clojure-indent ; better compojure indent
            (defroutes 'defun)
            (GET 2)
            (POST 2)
            (PUT 2)
            (DELETE 2)
            (HEAD 2)
            (ANY 2)
            (context 2))

  :mode (("\\.clj\\'" . clojure-mode)
         ("\\.cljc\\'" . clojure-mode)
         ("\\.edn\\'" . clojure-mode)))

(use-package clojurescript-mode
  :mode (("\\.cljs\\'" . clojurescript-mode)))

;; clojure(script) ide and repl
(use-package cider
  :config (setq cider-repl-use-clojure-font-lock t))

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
(use-package ruby-tools-mode
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
