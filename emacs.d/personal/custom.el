;; custom settings

(prelude-require-packages '(transpose-frame))

(require 'transpose-frame)

(add-hook 'java-mode-hook
          (lambda ()
            (setq c-basic-offset 2)))

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
