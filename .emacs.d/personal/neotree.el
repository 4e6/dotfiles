(prelude-require-package 'neotree)

(global-set-key
  (kbd "C-c p n")
  (lambda ()
    (interactive)
    (neotree-dir default-directory)))
