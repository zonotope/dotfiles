;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; interface                                                                ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; set the window size
(add-to-list 'default-frame-alist '(height . 50))
(add-to-list 'default-frame-alist '(width . 80))

;;; set the font to Inconsolata
(add-to-list 'default-frame-alist '(font . "Inconsolata-g-10"))

;;; horizontal line cursor
(set-default 'cursor-type 'hbar)

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

;;; "<user-name>: <buffer-name> -- emacs" in the title bar
(setq frame-title-format (list (getenv "USER")
                               ": %b -- "
                               "emacs"))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; set the load path and theme                                              ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;; custom elisp
(setq user-lisp-dir (expand-file-name "lisp" user-emacs-directory))
(add-to-list 'load-path user-lisp-dir)

;;;; themes
(setq theme-dir (expand-file-name "themes" user-emacs-directory))
(add-to-list 'custom-theme-load-path theme-dir)

;;; tomorrow-night-eighties is tha shiz
(load-theme 'tomorrow-night-eighties t)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; install my packages                                                      ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'packages)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; behavior                                                                 ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; load the custom elisp commands
(require 'commands)

;;;; set the path if this is on a mac
(if (string-equal (symbol-name system-type) "darwin")
    (set-exec-path-from-shell-PATH))


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

;;; 3 line top/bottom scroll margin for the cursor
(setq scroll-margin 3)

;;; even with the mouse wheel
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))

;;; always end a file with a newline
(setq require-final-newline t)

;;; don't ever split the window for a pop-up buffer
(setq split-width-threshold nil)
(setq split-height-threshold nil)

;;; no tabs. use 2 spaces instead.
(setq-default indent-tabs-mode nil)
(setq standard-indent 2)

;;; wrap lines at 80 characters
(setq-default fill-column 80)

;;; sentences can end in a single space
(setq sentence-end-double-space nil)

;;; use hippie-expand instead of dabbrev for better partial word completions
(global-set-key (kbd "M-/") 'hippie-expand)

;;; spelling
;; use aspell to spell check
(if (executable-find "aspell")
    (progn
      (setq ispell-program-name "aspell")
      (setq ispell-extra-args '("--sug-mode=ultra" "--lang=en_US"))))

;; check spelling everywhere for text based modes
(add-hook 'text-mode-hook 'flyspell-mode)

;; check spelling only in strings and comments for programming based modes
(add-hook 'prog-mode-hook 'flyspell-prog-mode)

;; don't print messages for every mispelled word
(setq flyspell-issue-message-flag nil)

;;; dired
(require 'dired )

;; enable dired-x
(add-hook 'dired-load-hook
          (function (lambda ()
                      (load "dired-x"))))

;; use the same buffer to view parent and sub-directories
(define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)
(define-key dired-mode-map (kbd "^") (lambda ()
                                       (interactive)
                                       (find-alternate-file "..")))


;;; ido
(ido-mode 1)
(setq ido-everywhere t)
(setq ido-enable-flex-matching t)

;;; automatically reload open files when they change on disk
(global-auto-revert-mode 1)

;;; enable company-mode
(global-company-mode)

;;; clean up whitespace before every save
(add-hook 'before-save-hook 'whitespace-cleanup)

;;; contextually uniquify buffer names
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward)

;;; pretty symbols
(if (fboundp 'global-prettify-symbols-mode)
    (global-prettify-symbols-mode +1))

;;; garbage collect every 20MB
(setq gc-cons-threshold 20000000)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; keybindings                                                              ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; don't delete the provided char in a zap forward.
(autoload 'zap-up-to-char "misc"
  "Kill up to, but not including ARGth occurrence of CHAR. \(fn arg char)"
  'interactive)
(global-set-key (kbd "M-z") 'zap-up-to-char)

;;; indent on yank
(global-set-key (kbd "C-y") 'yank-and-indent)

;;; M-D for backward-kill-word
(global-set-key (kbd "M-D") 'backward-kill-word)

;;; C-x g for magit
(global-set-key (kbd "C-x g") 'magit-status)

;;; C-x k to kill *this* buffer
(global-set-key (kbd "C-x k") 'kill-this-buffer)

;;; C-c c to wrap region in a wide comment box
(global-set-key (kbd "C-c c") 'wide-comment-box)

;;; M-; to comment or uncomment region or current line if no active region.
(global-set-key (kbd "M-;") 'comment-or-uncomment-region-or-line)

;;; C-c r to rename the buffer and the file it's visiting
(global-set-key (kbd "C-c r") 'rename-current-buffer-file)

;;; "C-c s" to slurp absorb the next sexp: ()"some thing" -> ("some thing")
(global-set-key (kbd "C-c s") 'sp-slurp-hybrid-sexp)

;;; M-n and M-p to scroll by a single line
(global-set-key (kbd "M-n") 'scroll-up-line)
(global-set-key (kbd "M-p") 'scroll-down-line)

;;; M-SPACE to cycle through spacing at point
(global-set-key (kbd "M-SPC") 'cycle-spacing)

;;; enable upcase region command (C-x C-u)
(put 'upcase-region 'disabled nil)

;;; enable dired-find-alternate-file to open subdirs in the same buffer
(put 'dired-find-alternate-file 'disabled nil)

;;; enable downcase-region command (C-x C-l)
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
;; disgusting hack                                                          ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;(package-initialize)
