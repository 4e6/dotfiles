;; Smooth scroll
;; C-, to scroll up, C-. to scroll down
(defun scroll-one-down ()
  (interactive)
  (scroll-down 1)
  (previous-line)
)
(global-set-key [(control ?,)] 'scroll-one-down)

(defun scroll-one-up ()
  (interactive)
  (scroll-up 1)
  (next-line)
)
(global-set-key [(control ?.)] 'scroll-one-up)

;; Scroll margin
(setq scroll-margin 5)
