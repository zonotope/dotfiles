;;;; install and configure packages

;;; directory of package config files
(setq package-config-dir "~/.emacs.d/package-config")

;;; set up elpa
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")
			 ("tromey" . "http://tromey.com/elpa/")))
(package-initialize)


;;; install a package with elpa.
(defun install (package)
  (unless (package-installed-p package)
    (package-install package)))

;;; install the missing packages in the list
(defun install-missing (packages)
  (let ((install-list (not-installed packages)))
    (when install-list
        (progn (package-refresh-contents)
	       (mapc 'install install-list)))))

;;; return a list of the packages that haven't been installed
(defun not-installed (packages)
  (when packages
    (let ((this-one (car packages))
          (the-rest (cdr packages)))
      (if (package-installed-p this-one)
          (not-installed the-rest)
        (cons this-one
              (not-installed the-rest))))))

;;; run initialization code in:
;;;  <emacs dir>/package-config/config-<package>.el
(defun configure (package)
  (let
      ((path (config-path package)))
    (if (file-exists-p path)
        (load path))))

(defun configure-all (packages)
  (mapc 'configure packages))

(defun config-path (symbol)
  (concat package-config-dir
          "/config-"
          (symbol-name symbol)
          ".el"))

;;; install packages in the list unless they're already installed,
;;; then configure those packages.
(defun use-packages (packages)
  (interactive)
  (install-missing packages)
  (configure-all packages))

(provide 'packages)
