;; scala-mode
(add-to-list 'load-path "/opt/git-repos/scala-dist/tool-support/src/emacs/")
(require 'scala-mode-auto)

;; load the ensime lisp code...
(add-to-list 'load-path "/opt/emacs-modes/ensime_2.10.0-SNAPSHOT-0.9.7/elisp/")
(require 'ensime)
;;
;; This step causes the ensime-mode to be started whenever
;; scala-mode is started for a buffer. You may have to customize this step
;; if you're not using the standard scala mode.
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)
