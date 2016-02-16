;; markdown-mode

(prelude-require-package 'markdown-mode)

(add-hook 'markdown-mode-hook
          '(lambda ()
             ;; set column width
             (set-fill-column 80)
             ;; turn on auto-fill-mode
             (turn-on-auto-fill)))
