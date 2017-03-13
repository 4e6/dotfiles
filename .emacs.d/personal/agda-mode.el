;; agda-mode
(load-file (let ((coding-system-for-read 'utf-8))
                (shell-command-to-string "agda-mode locate")))
;; add stdlib to path
(setq agda2-include-dirs '("." "/usr/share/agda/lib/prim"))
