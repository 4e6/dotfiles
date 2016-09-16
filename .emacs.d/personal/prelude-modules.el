;;; Uncomment the modules you'd like to use and restart Prelude afterwards

(require 'prelude-erc) ;; Emacs IRC client
(require 'prelude-ido) ;; Super charges Emacs completion for C-x C-f and more
(require 'prelude-helm) ;; Interface for narrowing and search
(require 'prelude-helm-everywhere) ;; Enable Helm everywhere
(require 'prelude-company)

;;; Programming languages support
(require 'prelude-c)
(require 'prelude-clojure)
(require 'prelude-emacs-lisp)
(require 'prelude-go)
(require 'prelude-haskell)
(require 'prelude-js)
(require 'prelude-latex)
(require 'prelude-lisp)
(require 'prelude-ocaml)
(require 'prelude-python)
(require 'prelude-shell)
(require 'prelude-xml)
(require 'prelude-yaml)

;;; Helm settings
(setq helm-M-x-fuzzy-match t)
