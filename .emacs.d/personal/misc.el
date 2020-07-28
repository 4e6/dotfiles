(prelude-require-packages
  '(company-coq memento-mori proof-general transpose-frame prettier-js))

(require 'transpose-frame)

;; helm interactive search with ripgrep
;'(helm-grep-ag-command
   ;"TERM=eterm-color rg --color=always --smart-case --no-heading --line-number %s %s %s")
(setq helm-ag-insert-at-point 'symbol)

(defun misc-sort-csv-region (&optional reverse)
  "Sort CSV, a list of identifiers (alphanumeric including spaces) delimited by
separator (anything besides alphanumeric or space) inside region. Prefix 'M-u'
reverses order."
  (interactive "P")
  (sort-regexp-fields
    reverse "\\([[:alnum:]_]\\([^,]+\\>\\((..)\\)?\\)*\\)" "\\1"
    (region-beginning)
    (region-end)))

(global-set-key (kbd "C-c C-w") 'misc-sort-csv-region)

(add-hook 'find-file-hook
          '(lambda ()
             (when (string= (file-name-extension buffer-file-name) "ptl")
               (whitespace-mode +1)
               (electric-indent-mode -1)
               (setq indent-tabs-mode t)
               (setq tab-always-indent nil))))

;; memento-mori
(require 'memento-mori)
(custom-set-variables
 '(memento-mori-birth-date "1988-03-06")
 '(memento-mori-mode 1))

;; coq
(add-hook 'coq-mode-hook #'company-coq-mode)

;; enable prettier-js formatter for file types
(add-hook 'markdown-mode-hook #'prettier-js-mode)

;; whitespace-mode settings
;;
;; * do not highlight tabs and mark them as `>>` character
;;   face tab removed and tab-mark added
;; * mark newline as `$` character
;;   face newline-mark
(custom-set-variables
 '(whitespace-style
   (quote
    (face newline empty trailing lines-tail tab-mark newline-mark))))
