(require 'goto-chg)
(define-key global-map (kbd "<f6>") 'goto-last-change)
(define-key global-map (kbd "S-<f6>") 'goto-last-change-reverse)

(provide 'init-goto-chg)
