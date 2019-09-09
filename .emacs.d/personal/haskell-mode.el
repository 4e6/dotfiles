;; prelude-haskell mode customization

(prelude-require-package 'flycheck-haskell)
(setq flycheck-ghc-args '("-O0"))

(require 'haskell-mode)
(add-hook 'haskell-mode-hook #'flycheck-haskell-setup)

(defun override-flycheck-haskell-default-directory (proc &rest args)
    (funcall proc 'haskell-ghc))
(advice-add 'flycheck-haskell--find-default-directory
            :around
            #'override-flycheck-haskell-default-directory)
(custom-set-variables
 '(haskell-stylish-on-save t))
