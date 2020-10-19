(defvar enso-mode-hook nil)

(defvar enso-font-lock-keywords
  `(
    ;; Keywords
    (,
     (rx (or "type " "import " "export " "from " "polyglot " "if" "then" "else" "case "))
     (0 font-lock-keyword-face))
    ;; Builtins
    (,
     (rx (or "Builtins" "Array" "Meta" "System" "True" "False" "Panic" "Polyglot_Error" "Text_Utils" "Time_Utils" "this" "here"))
     (0 font-lock-builtin-face))
    ;; Ascriptions
    (,
     (rx (group (one-or-more (in alnum "=_+-"))) (zero-or-more space) ":")
     (1 font-lock-variable-name-face))
    ;; Assignments
    (,
     (rx
      (group (one-or-more (in alnum "=_+-")))
      (zero-or-more space (one-or-more (in alnum "_()=~.")))
      (zero-or-more space)
      "=")
     (1 font-lock-variable-name-face))
    )
  "Font lock keywords for enso")

(defvar enso-mode-syntax-table
  (let ((syntax-table (make-syntax-table)))
    ;; Python-style comments.
    (modify-syntax-entry ?# "<" syntax-table)
    (modify-syntax-entry ?\n ">" syntax-table)
    ;; Strings.
    (modify-syntax-entry ?\" "\"" syntax-table)
    ;; Blocks.
    (modify-syntax-entry ?\{ "(}" syntax-table)
    (modify-syntax-entry ?\} "){" syntax-table)
    ;; Parens.
    (modify-syntax-entry ?\( "()" syntax-table)
    (modify-syntax-entry ?\) ")(" syntax-table)
    ;; Lists.
    (modify-syntax-entry ?\[ "(]" syntax-table)
    (modify-syntax-entry ?\] ")[" syntax-table)

    (modify-syntax-entry ?@ "'" syntax-table)
    syntax-table)
  "Syntax table in use in `enso-mode' buffers.")

;;;###autoload
(define-derived-mode enso-mode prog-mode "Enso"
  "Minor mode for editing Enso.

\\{enso-mode-map}"
  (setq font-lock-defaults '(enso-font-lock-keywords))
  (run-hooks 'enso-mode-hook))

;;;###autoload
(add-to-list 'auto-mode-alist '("\\.enso\\'" . enso-mode))

(provide 'enso-mode)
