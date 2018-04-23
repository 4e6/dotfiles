(prelude-require-packages
  '(flycheck-haskell))

(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-haskell-setup))
