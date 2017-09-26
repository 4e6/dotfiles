;; purescript

(prelude-require-packages '(purescript-mode psc-ide))

(require 'psc-ide)

(add-hook 'purescript-mode-hook
  (lambda ()
    (psc-ide-mode)
    (company-mode)
    (flycheck-mode)
    (turn-on-purescript-indentation)))

;; use ./node_modules/.bin/purs
(setq psc-ide-use-npm-bin t)
