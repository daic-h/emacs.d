(lazyload (quickrun quickrun/exec-rspec) "quickrun")

(global-set-key (kbd "C-c C-q") 'quickrun/exec-rspec)
;; (global-set-key (kbd "<f5>") 'quickrun)
;; (global-set-key (kbd "M-<f5>") 'quickrun-compile-only)

(defun quickrun/exec-rspec ()
  (interactive)
  (let* ((cmd "git rev-parse --show-toplevel")
         (topdir (with-temp-buffer
                   (call-process-shell-command cmd nil t nil)
                   (goto-char (point-min))
                   (if (re-search-forward "^\\(.+\\)$" nil t)
                       (match-string 1)))))
    (quickrun :source `((:command . "bundle exec rspec")
                        (:default-directory . ,topdir)
                        (:exec . (,(format "%%c -c %s:%s" buffer-file-name (line-number-at-pos))))))))

(provide 'init-quickrun)
