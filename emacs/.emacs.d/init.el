;;;; interface

;;; set the window size
(add-to-list 'default-frame-alist '(height . 50))
(add-to-list 'default-frame-alist '(width . 80))

;;; horizontal line cursor
(set-default 'cursor-type 'hbar)

;;; set the font to inconsolata
(set-default-font "Inconsolata-g-12")

;;; no cursor in non selected windows
(set-default 'cursor-in-non-selected-windows 'nil)

;;; no menu bar if there is one
(if (fboundp 'menu-bar-mode)
    (menu-bar-mode -1))

;;; no scroll bar if there is one
(if (fboundp 'scroll-bar-mode)
    (scroll-bar-mode -1))

;;; no toolbar if there is one
(if (fboundp 'tool-bar-mode)
    (tool-bar-mode -1))

;;; no splash screen
(setq inhibit-splash-screen t)

;;; "<user-name> - <buffer-name> - emacs" in the title bar
(setq frame-title-format (list (getenv "USER")
                               ": %b -- "
                               "emacs"))

;;;; load all my shit
(setq site-lisp-dir (expand-file-name "site-lisp" user-emacs-directory))
(add-to-list 'load-path site-lisp-dir)

(setq theme-dir (expand-file-name "themes" user-emacs-directory))
(add-to-list 'load-path theme-dir)

;;;; set the color theme
(require 'color-theme-tomorrow)
(color-theme-tomorrow-night-eighties)

;;;; load the slime helper and sbcl for stumpwm
(setq slime-helper "/usr/local/share/sbcl/slime-helper.el")
(if (file-exists-p slime-helper)
    (load (expand-file-name slime-helper)))
(setq inferior-lisp-program "sbcl")

;;;; install some packages
(require 'packages)

(use-packages
 '(ace-jump-mode             ; jump around in buffers
   cider                     ; clojure ide and repl
   clojure-mode              ; major mode for clojure
   clojurescript-mode        ; major mode for clojurescript
   coffee-mode               ; major mode for coffeescript
   color-theme-solarized     ; solarized color themes
   css-mode                  ; major mode for css
   dired-details             ; clean up dired
   diminish                  ; declutter the mode line
   feature-mode              ; major mode for cucumber feature tests
   find-things-fast          ; find files and strings in projects
   flx-ido                   ; better flex matching for ido
   ido-vertical-mode         ; show ido-results vertically
   js2-mode                  ; javascript ide
   lua-mode                  ; major mode for lua
   magit                     ; git interface
   markdown-mode             ; major mode for markdown
   php-mode                  ; major mode for php
   pixie-mode                ; major mode for pixie
   ruby-mode                 ; major mode for ruby
   ruby-tools                ; more ruby mode extras
   rust-mode                 ; major mode for rust.
   slim-mode                 ; major mode for html slim templates
   smartparens               ; delimiter matching and highlighting
   stylus-mode               ; majore mode for stylus and jade files
   switch-window             ; visually switch windows
   toml-mode                 ; major mode for toml
   yaml-mode                 ; major mode for yaml
   ))


;;;; behavior

;;; text mode as default
(setq default-major-mode 'text-mode)

;;; no backups
(setq make-backup-files nil)

;;; no autosave
(setq auto-save-default nil)

;;; column number mode on startup
(column-number-mode 1)

;;; follow version controlled symlinks without asking
(setq vc-follow-symlinks t)

;;; scroll 1 line at a time
(setq scroll-step 1)

;;; even with the mouse wheel
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))

;;; always end a file with a newline
(setq require-final-newline t)

;;; don't ever split the window horizontally for a pop-up buffer
(setq split-width-threshold nil)

;;; no tabs. use 2 spaces instead.
(setq-default indent-tabs-mode nil)
(setq standard-indent 2)

;;; wrap lines at 80 characters
(setq-default fill-column 80)

;;; ido mode everywhere
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

;;; display ido results vertically
(ido-vertical-mode 1)

;;; automatically reload open files when they change on disk
(global-auto-revert-mode 1)

;;; auto indent lines
(electric-indent-mode 1)

;;; delete trailing whitespace before every save
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;;; contextually uniquify buffer names
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward)

;;; pretty symbols

(if (fboundp 'menu-bar-mode)
    (global-prettify-symbols-mode +1))

;;; garbage collect every 20MB
(setq gc-cons-threshold 20000000)

;;;; auto modes

;;; mail mode when called from mutt
(add-to-list 'auto-mode-alist '("mutt-" . mail-mode))

;;;; keybindings

;;; don't delete the provided char in a zap forward.
(autoload 'zap-up-to-char "misc"
  "Kill up to, but not including ARGth occurrence of CHAR. \(fn arg char)"
  'interactive)
(global-set-key (kbd "M-z") 'zap-up-to-char)

;;; M-D for backward-kill-word
(global-set-key (kbd "M-D") 'backward-kill-word)

;;; C-x g for magit
(global-set-key (kbd "C-x g") 'magit-status)

;;; M-; to comment or uncomment region or current line if no active region.
(require 'comments)
(global-set-key (kbd "M-;") 'comment-or-uncomment-region-or-line)

;;;; C-x C-r to rename the buffer and the file it's visiting
(require 'renaming)
(global-set-key (kbd "C-x C-r") 'rename-current-buffer-file)

;;; M-n and M-p to scroll by a single line
(global-set-key (kbd "M-n") 'scroll-up-line)
(global-set-key (kbd "M-p") 'scroll-down-line)

;;; enable upcase region command (C-x C-u)
(put 'upcase-region 'disabled nil)

;;; enable downcase-region command (C-x C-l)
(put 'downcase-region 'disabled nil)

;;;; set bindings that should not be overridden by other modes
(require 'pbinding)

;;; "C-j" for ace-jump-mode
(set-permanent-key (kbd "C-j") 'ace-jump-mode)
