;; in order to generate bibliography properly we need texi2dvi
(setq org-latex-pdf-process '("texi2dvi --pdf --clean --verbose --batch %f"))
