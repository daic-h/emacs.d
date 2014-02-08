(add-hook-fn 'scheme-mode
 (require 'cmuscheme))

(defun scheme-other-window ()
  "Run scheme on other window"
  (interactive)
  (let ((program-name "gosh"))
    (switch-to-buffer-other-window
     (get-buffer-create "*scheme*"))
    (run-scheme program-name)))

(define-key global-map (kbd "C-c S") 'scheme-other-window)
