(require 'quickrun)

(push '("*quickrun*") popwin:special-display-config)

(quickrun-add-command "ruby/rspec"
                      '((:command . "bundle exec rspec")
                        (:exec    . "%c -c %s")))

(add-to-list 'quickrun-file-alist '("_spec\\.rb$" . "ruby/rspec"))

(global-set-key (kbd "C-c q") 'quickrun)
;; (global-set-key (kbd "<f5>") 'quickrun)
;; (global-set-key (kbd "M-<f5>") 'quickrun-compile-only)

(provide 'init-quickrun)
