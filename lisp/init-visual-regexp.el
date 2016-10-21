(setq vr/match-separator-string
      (progn
        (custom-reevaluate-setting 'query-replace-from-to-separator)
        (substring-no-properties query-replace-from-to-separator)))

(require 'visual-regexp-steroids)
(setq vr/engine 'pcre2el)

(define-key global-map (kbd "C-c r") 'vr/replace)
(define-key global-map (kbd "C-c q") 'vr/query-replace)
(define-key global-map (kbd "C-c m") 'vr/mc-mark)

(global-set-key (kbd "C-M-r") 'vr/isearch-backward)
(global-set-key (kbd "C-M-s") 'vr/isearch-forward)

(provide 'init-visual-regexp)
