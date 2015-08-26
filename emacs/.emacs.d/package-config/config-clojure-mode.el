(require 'clojure-mode)

;; check spelling in comments
(add-hook 'clojure-mode-hook 'flyspell-prog-mode)

;; better compojure indent
(define-clojure-indent
  (defroutes 'defun)
  (GET 2)
  (POST 2)
  (PUT 2)
  (DELETE 2)
  (HEAD 2)
  (ANY 2)
  (context 2))
