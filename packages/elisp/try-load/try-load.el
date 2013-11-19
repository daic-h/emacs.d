(eval-when-compile (require 'cl))

(defvar try-load-slow-threshold 0.1)
(defvar try-load-result-buffer "*initialize*")
(defvar try-load-logs nil)
(defvar try-load-err-logs nil)
(defvar try-load-slow-logs nil)

(defun try-load (file &optional noerror)
  (condition-case err
      (try-load--success file (benchmark-run (load file noerror)))
    (error (try-load--fail file (error-message-string err)))))

(defun try-load--success (file time)
  (let* ((adjust-time (try-load--format-time (car time)))
         (msg (format " %s.sec %s" adjust-time file)))
    (push msg try-load-logs)
    (when (< try-load-slow-threshold (string-to-number adjust-time))
      (push msg try-load-slow-logs))))

(defun try-load--fail (file err)
  (push (format " %s %s" file err) try-load-err-logs))

(defun try-load--show (var)
  (mapconcat 'identity (reverse var) "\n"))

(defun try-load--result ()
  (let ((buf (get-buffer-create try-load-result-buffer)))
    (with-current-buffer buf
      (erase-buffer)
      (insert "Time:\n " (emacs-init-time) "\n\n")
      (when try-load-err-logs
        (insert "Fail:\n" (try-load--show try-load-err-logs) "\n\n"))
      (when try-load-logs
        (insert "Success:\n" (try-load--show try-load-logs)))
      (when try-load-slow-logs
        (try-load--put-text-property buf))
      (goto-char (point-min)))
    (try-load--clear-logs)
    (switch-to-buffer buf)))

(defun try-load--format-time (time)
  (let* ((str-time (truncate-string-to-width (format "%f" time) 6 0))
         (str-len (length str-time)))
    (if (< str-len 6)
        (concat str-time (make-string (- 6 str-len) ?0))
      str-time)))

(defun try-load--clear-logs ()
  (setq try-load-logs nil
        try-load-err-logs nil
        try-load-slow-logs nil))

(defun try-load--put-text-property (buf)
  (with-current-buffer buf
    (loop for txt in try-load-slow-logs
          do (goto-char (point-min))
          (while (search-forward txt nil t)
            (put-text-property (match-beginning 0) (match-end 0)
                               'face font-lock-keyword-face)))))

(eval-after-load "try-load"
  '(add-hook 'after-init-hook 'try-load--result))

(provide 'try-load)
