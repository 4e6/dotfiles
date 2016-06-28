;; agda-mode
(load-file (let ((coding-system-for-read 'utf-8))
                (shell-command-to-string "/home/dbushev/bin/agda-mode locate")))
;; add stdlib to path
(setq agda2-include-dirs '("." "/home/dbushev/projects/agda/agda-stdlib/src"))
