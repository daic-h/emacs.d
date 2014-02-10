;; ElScreen
(require 'elscreen)
(elscreen-start)

(setq elscreen-display-tab nil)
;; (setq elscreen-display-screen-number nil)
(setq elscreen-tab-display-control nil)
(setq elscreen-tab-display-kill-screen nil)

(global-set-key (kbd "C-z C-b") 'helm-elscreen)

(provide 'init-elscreen)
