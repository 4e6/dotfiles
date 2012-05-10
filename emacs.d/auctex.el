(if (not (package-installed-p 'auctex)) (package-install 'auctex))

(custom-set-variables '(fill-column 120))
(setq TeX-PDF-mode t)
(eval-after-load "tex"
  '(add-to-list 'TeX-command-list
    '("Glossary" "makeglossaries %s" TeX-run-command t (latex-mode) :help "Create glossaries") t))

