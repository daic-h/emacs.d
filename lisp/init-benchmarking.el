(defvar init-require-times nil
  "A list of (FEATURE . LOAD-DURATION).
LOAD-DURATION is the time taken in milliseconds to load FEATURE.")

(defmacro require-init (feature)
  `(condition-case err
       (let ((already-loaded (memq ,feature features))
             (require-time (benchmark-run (require ,feature))))
         (unless already-loaded
           (add-to-list 'init-require-times
                        (cons ,feature (car require-time)))))
     (error (message (format "[ERROR] %s: %s" ,feature err)))))

(defun init-benchmarking-after-hook ()
  (dolist (detail init-require-times)
    (message "%s completed in %.2fms" (car detail) (cdr detail)))
  (message "total time: %.3f sec"
           (float-time (time-subtract after-init-time before-init-time))))

(add-hook 'after-init-hook 'init-benchmarking-after-hook)

(provide 'init-benchmarking)
