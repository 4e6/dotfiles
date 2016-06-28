;; sbt-mode

(prelude-require-package 'sbt-mode)

(add-hook 'scala-mode-hook
          '(lambda ()
             (setq scala-indent:use-javadoc-style t
                   sbt:prefer-nested-projects t)

             ;; sbt-find-definitions is a command that tries to find (with grep)
             ;; the definition of the thing at point.
             (local-set-key (kbd "M-.") 'sbt-find-definitions)

             ;; use sbt-run-previous-command to re-compile your code after changes
             (local-set-key (kbd "C-x '") 'sbt-run-previous-command)

             ;; issue sbt command
             (local-set-key (kbd "C-c C-c") 'sbt-command)))
