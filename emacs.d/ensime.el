;; start scala-mode2
(require 'scala-mode2)

;; load the ensime lisp code...
(add-to-list 'load-path "/opt/ensime/ensime_current/elisp/")
(require 'ensime)

;; This step causes the ensime-mode to be started whenever
;; scala-mode is started for a buffer. You may have to customize this step
;; if you're not using the standard scala mode.
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)
