;; custom settings
(setenv "PATH"
  (concat (getenv "PATH")
          (concat (concat ":" (getenv "HOME")) "/bin")))
(setq exec-path
  (cons (concat (getenv "HOME") "/bin") exec-path))

(prelude-require-packages
  '(projectile-ripgrep transpose-frame))

(require 'transpose-frame)
(require 'projectile-ripgrep)

(add-hook 'java-mode-hook
          (lambda ()
            (setq c-basic-offset 2)))

;; helm interactive search with ripgrep
'(helm-grep-ag-command
   "TERM=eterm-color rg --color=always --smart-case --no-heading --line-number %s %s %s")

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
 '(whitespace-style
   (quote
    (face newline empty trailing lines-tail tab-mark newline-mark))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
