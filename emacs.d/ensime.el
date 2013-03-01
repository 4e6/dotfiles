;; load the ensime lisp code...
(add-to-list 'load-path "/opt/ensime/ensime_current/elisp/")
(require 'scala-mode2)
(require 'ensime)
(require 'ensime-tooltip)

(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)
