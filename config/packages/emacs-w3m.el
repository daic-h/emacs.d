;; emacs-w3m
;; (require 'w3m-load)
;; (require 'w3m)

(lazyload (w3m) "w3m"
 (setq w3m-command "/usr/local/bin/w3m")

 ;; w3mを立ち上げ時に開かれるページ
 (setq w3m-home-page "http://www.google.co.jp")

 ;; 画像をインラインで表示
 (setq w3m-default-display-inline-images t)
 (setq w3m-favicon-cache-expire-wait nil)

 ;; Key bind
 (define-key w3m-mode-map (kbd "B") 'w3m-view-previous-page)
 (define-key w3m-mode-map (kbd "F") 'w3m-view-next-page)
 (define-key w3m-mode-map (kbd "l") '(lambda () (interactive) (w3m-next-buffer 1)))
 (define-key w3m-mode-map (kbd "h") '(lambda () (interactive) (w3m-next-buffer -1)))
 (define-key w3m-mode-map (kbd "o") 'w3m-delete-buffer)
 (define-key w3m-mode-map (kbd "i") 'w3m-next-anchor)
 (define-key w3m-mode-map (kbd ";") 'w3m-view-this-url-new-session)
 (define-key w3m-mode-map (kbd "'") 'w3m-view-this-url))
