(prelude-require-packages
  '(company-coq memento-mori projectile-ripgrep proof-general transpose-frame))

(require 'transpose-frame)
(require 'projectile-ripgrep)

;; helm interactive search with ripgrep
'(helm-grep-ag-command
   "TERM=eterm-color rg --color=always --smart-case --no-heading --line-number %s %s %s")

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

;; whitespace-mode settings
;; * do not highlight tabs and mark them as `>>` character
;;   face tab removed and tab-mark added
;; * mark newline as `$` character
;;   face newline-mark
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(sgml-basic-offset 4)
 '(whitespace-style
   (quote
    (face newline empty trailing lines-tail tab-mark newline-mark))))
