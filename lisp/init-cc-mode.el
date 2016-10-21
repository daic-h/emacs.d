(add-hook-fn 'c-mode-common-hook
  (setq c-basic-offset 4)
  (setq tab-width 4))
;; Cのソースにはタブがよく出るのでしょうがなく
;; (face-remap-add-relative 'my-face-b-2 '(:background nil)))

(provide 'init-cc-mode)
