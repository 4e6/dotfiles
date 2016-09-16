;; scala-mode

(prelude-require-packages '(scala-mode sbt-mode))

(add-hook 'scala-mode-hook
          (lambda ()
            (subword-mode +1)
            (scala-mode:goto-start-of-code)
            ;; sbt-find-definitions is a command that tries to find (with grep)
            ;; the definition of the thing at point.
            (local-set-key (kbd "M-.") 'sbt-find-definitions)
            ;; use sbt-run-previous-command to re-compile your code after changes
            (local-set-key (kbd "C-x '") 'sbt-run-previous-command)
            ;; issue sbt command
            (local-set-key (kbd "C-c C-c") 'sbt-command)))

(add-hook 'sbt-mode-hook
          (lambda ()
            (add-hook
              'before-save-hook
              'sbt-hydra:check-modified-buffers)))
