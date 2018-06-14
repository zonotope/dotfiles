;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; interface                                                                ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; set the window size
(add-to-list 'default-frame-alist '(width . 80))
(add-to-list 'default-frame-alist '(height . 80))

;; set the font to Inconsolata
(add-to-list 'default-frame-alist '(font . "Inconsolata\-g-10"))

;; make the cursor as conspicuous as possible
(set-default 'cursor-type 'box)

;; no cursor in non selected windows
(set-default 'cursor-in-non-selected-windows 'nil)

;; no menu bar if there is one
(if (fboundp 'menu-bar-mode)
    (menu-bar-mode -1))

;; no scroll bar if there is one
(if (fboundp 'scroll-bar-mode)
    (scroll-bar-mode -1))

;; no toolbar if there is one
(if (fboundp 'tool-bar-mode)
    (tool-bar-mode -1))

;; no splash screen
(setq inhibit-splash-screen t)

;; make all confirmation dialogues 'y/n' instead of 'yes/no' because i'm lazy
(fset 'yes-or-no-p 'y-or-n-p)

;; "<user-name>: <buffer-name> -- emacs" in the title bar
(setq frame-title-format (list (getenv "USER")
                               ": %b -- "
                               "emacs"))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; set the load path and theme                                              ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; custom elisp
(setq user-lisp-dir (expand-file-name "lisp" user-emacs-directory))
(add-to-list 'load-path user-lisp-dir)

;; themes
(setq theme-dir (expand-file-name "themes" user-emacs-directory))
(add-to-list 'custom-theme-load-path theme-dir)

;;;; my theme is my favorite theme
(load-theme 'zonotope-dark t)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; load config modules                                                      ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; install packages
(require 'packages)

;; set up org mode
(require 'org-config)

;; set up email
;; (require 'mail-config)

;; load the custom elisp commands
(require 'commands)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; behavior                                                                 ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; org mode as default
(setq default-major-mode 'org-mode)

;; no backups
(setq make-backup-files nil)

;; no autosave
(setq auto-save-default nil)

;; column number mode on startup
(column-number-mode 1)

;; follow version controlled symlinks without asking
(setq vc-follow-symlinks t)

;; use shift + arrow keys for window navigation
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

;; scroll 1 line at a time
(setq scroll-step 1)

;; 3 line top/bottom scroll margin for the cursor
(setq scroll-margin 3)

;; even with the mouse wheel
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))

;; always end a file with a newline
(setq require-final-newline t)

;; don't ever split the window for a pop-up buffer
(setq split-width-threshold nil
      split-height-threshold nil)

;; always try to split/recombine windows evenly
(setq window-combination-resize t)

;; save window configuration so changes can be undone
(winner-mode 1)

;; no tabs. use 2 spaces instead.
(setq-default indent-tabs-mode nil)
(setq standard-indent 2)

;; wrap lines at 80 characters
(setq-default fill-column 80)

;; sentences can end in a single space
(setq sentence-end-double-space nil)

;; use hippie-expand instead of dabbrev for better partial word completions
(global-set-key (kbd "M-/") 'hippie-expand)

;; set the command key to meta on macs
(if (memq window-system '(mac ns))
    (setq mac-command-modifier 'meta
          mac-command-key-is-meta t))

;; quickly cycle through the mark ring with C-u C-<SPC> and then C-<SPC>
(setq set-mark-command-repeat-pop t)

;; spelling

;;;; use aspell to spell check
(if (executable-find "aspell")
    (setq ispell-program-name "aspell"
          ispell-extra-args '("--sug-mode=ultra" "--lang=en_US")))

;;;; check spelling everywhere for text based modes
(add-hook 'text-mode-hook 'flyspell-mode)

;;;; check spelling only in strings and comments for programming based modes
(add-hook 'prog-mode-hook 'flyspell-prog-mode)

;;;; don't print messages for every mispelled word
(setq flyspell-issue-message-flag nil)

;; dired
(require 'dired )

;;;; enable dired-x
(add-hook 'dired-load-hook
          (function (lambda ()
                      (load "dired-x"))))

;; ido
(ido-mode 1)
(setq ido-everywhere t
      ido-enable-flex-matching t
      ido-use-faces t)

;;;; automatically reload open files when they change on disk
(global-auto-revert-mode 1)

;; enable company-mode
(global-company-mode)

;; clean up whitespace before every save
(add-hook 'before-save-hook 'whitespace-cleanup)

;; contextually uniquify buffer names
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward)

;; pretty symbols
(if (fboundp 'global-prettify-symbols-mode)
    (global-prettify-symbols-mode +1))

;; garbage collect every 20MB
(setq gc-cons-threshold 20000000)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; keybindings                                                              ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; no rg files confirmation
;; TODO: remove when/if upstream rg.el maintainer accepts my pr adding this
(global-set-key (kbd "C-x C-/") 'bl/rg-regexp-project)

;; don't delete the provided char in a zap forward.
(autoload 'zap-up-to-char "misc"
  "Kill up to, but not including ARGth occurrence of CHAR. \(fn arg char)"
  'interactive)
(global-set-key (kbd "M-z") 'zap-up-to-char)

;; indent on yank
(global-set-key (kbd "C-y") 'yank-and-indent)
(global-set-key (kbd "C-y") 'yank)

;; M-D for backward-kill-word
(global-set-key (kbd "M-D") 'backward-kill-word)

;; C-x g for magit
(global-set-key (kbd "C-x g") 'magit-status)

;; C-c b to wrap region in a wide comment box
(global-set-key (kbd "C-c b") 'wide-comment-box)

;; M-; to comment or uncomment region or current line if no active region.
(global-set-key (kbd "M-;") 'comment-or-uncomment-region-or-line)

;; "C-c s" to slurp absorb the next sexp: ('some) 'thing -> ('some 'thing)
(global-set-key (kbd "C-c s") 'sp-slurp-hybrid-sexp)

;; M-n and M-p to scroll by a single line
(global-set-key (kbd "M-n") 'scroll-up-line)
(global-set-key (kbd "M-p") 'scroll-down-line)

;; M-SPACE to cycle through spacing at point
(global-set-key (kbd "M-SPC") 'cycle-spacing)

;; use ibuffer instead of buffer-list
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; just kill the current buffer with 'C-x k' instead of prompting for one.
(global-set-key (kbd "C-x k") 'bl/kill-this-buffer)

;; kill the current window with a friendlier binding than the default
(global-set-key (kbd "C-x w") 'delete-frame)

;; enable upcase region command (C-x C-u)
(put 'upcase-region 'disabled nil)

;; enable dired-find-alternate-file to open subdirs in the same buffer
(put 'dired-find-alternate-file 'disabled nil)

;; enable downcase-region command (C-x C-l)
(put 'downcase-region 'disabled nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; start servers                                                            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; listen for emacsclient connections
(require 'server)
(unless (server-running-p)
  (server-start))

;; listen for chrome text area edit connections
(edit-server-start)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; disgusting hacks                                                         ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;;
;;(package-initialize)
