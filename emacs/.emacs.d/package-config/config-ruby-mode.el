(require 'ruby-mode)
(autoload 'ruby-mode "ruby-mode" nil t)

;;; all the files to start ruby mode for
(add-to-list 'auto-mode-alist '("Capfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rb\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec\\'" . ruby-mode))

(add-hook 'ruby-mode-hook '(lambda ()
                             (setq ruby-deep-arglist t)
                             (setq ruby-deep-indent-paren nil)
                             (setq c-tab-always-indent nil)))

(eval-after-load 'ruby-mode
  '(progn
     ;; backward kill word
     (define-key ruby-mode-map (kbd "C-M-h") 'backward-kill-word)))

;;; rake commands
;; completion for ssh
(defun pcomplete/rake ()
  (pcomplete-here (pcmpl-rake-tasks)))

;; list all rake tasks in the project
(defun pcmpl-rake-tasks ()
  (delq nil (mapcar '(lambda(line)
                       (if (string-match "rake \\([^ ]+\\)" line)
                           (match-string 1 line)))
                    (split-string (shell-command-to-string "rake -T") "[\n]"))))

;; and rake itself
(defun rake (task)
  (interactive (list (completing-read "Rake (default: default): "
                                      (pcmpl-rake-tasks))))
  (shell-command-to-string (concat "rake " (if (= 0 (length task)) "default" task))))
