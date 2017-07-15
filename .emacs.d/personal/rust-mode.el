(prelude-require-packages
  '(rust-mode flycheck-rust))

(add-hook 'flycheck-mode-hook #'flycheck-rust-setup)
