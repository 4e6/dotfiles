;; Show ensime tooltip

(require 'thingatpt)

(defvar ensime-tooltip-timer nil
 "Timer to activate re-highlighting.")

(defun ensime-tooltip-word-at-point ()
  "Highlight the word under the point."
  (progn
    (ensime-eval-async
     `(swank:type-at-point ,buffer-file-name ,(ensime-computed-point))
     #'(lambda (type)
         (when type
           (let ((msg (ensime-type-full-name-with-args type)))
             (message msg)
             ))))))

;;;###autoload
(defun ensime-tooltip (&optional arg)
 "Toggle ensime-tooltiping."
 (interactive "P")
 (if (and (boundp 'ensime-tooltip-timer)
          ensime-tooltip-timer)
     (progn
       (cancel-timer ensime-tooltip-timer)
       (setq ensime-tooltip-timer nil))
   (set (make-local-variable 'ensime-tooltip-timer)
        (run-with-idle-timer 0.5 :repeat 'ensime-tooltip-word-at-point))))

(provide 'ensime-tooltip)

(global-set-key (kbd "C-c C-t") '(lambda () (interactive) (ensime-tooltip-word-at-point)))
;;; ensime-tooltip.el ends here
