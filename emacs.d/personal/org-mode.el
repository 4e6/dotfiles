(require 'ox-latex)
(setq org-latex-listings t)

;;; XeLaTeX customisations
;; remove "inputenc" from default packages as it clashes with xelatex
(setf org-latex-default-packages-alist
      (remove '("AUTO" "inputenc" t) org-latex-default-packages-alist))

(add-to-list 'org-latex-packages-alist '("" "xltxtra" t))
;; choose Linux Libertine O as serif and Linux Biolinum O as sans-serif fonts
(add-to-list 'org-latex-packages-alist '("" "libertine" t))

;; org to latex customisations, -shell-escape needed for minted
(setq org-latex-pdf-process               ; for regular export
      '("xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"))

;; in order to generate bibliography properly we need texi2dvi
;;(setq org-latex-pdf-process '("texi2dvi --pdf --clean --verbose --batch %f"))
