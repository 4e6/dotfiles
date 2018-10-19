;; prelude-haskell mode customization

(require 'flycheck)
(setq flycheck-ghc-args '("-O0"))

(require 'haskell-mode)
(defun override-flycheck-haskell-default-directory (proc &rest args)
    (funcall proc 'haskell-ghc))
(advice-add 'flycheck-haskell--find-default-directory
            :around
            #'override-flycheck-haskell-default-directory)
