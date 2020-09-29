(defvar enso-mode-hook nil)

(defvar enso-font-lock-keywords
  ;; Keywords
  `(,(regexp-opt '("type" "import" "export" "from" "polyglot" "if" "then" "else" "case") 'symbols)
  ;; Assignments
    (,(rx symbol-start (group (in alpha "_") (zero-or-more (in alnum "_.'-"))) (zero-or-more space) "=")
     (1 font-lock-variable-name-face)))
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
  (setq font-lock-defaults '(enso-font-lock-keywords)))

;;;###autoload
(add-to-list 'auto-mode-alist '("\\.enso\\'" . enso-mode))

(provide 'enso-mode)
