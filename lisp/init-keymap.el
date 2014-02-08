;;
;; Global key bind
;;________________________________________________________________
(define-key global-map (kbd "C-c a")   'align-regexp)
(define-key global-map (kbd "M-?")     'help-for-help)        ; helpをメタ+?に
(define-key global-map (kbd "C-h")     'delete-backward-char) ; C-hにバックスペース
(define-key global-map (kbd "C-S-i")   'indent-region)        ; リージョンをインデント
(define-key global-map [?¥] [?\\])                            ; ¥の代わりにバックスラッシュを入力する
(define-key global-map (kbd "C-j")     'delete-indentation)   ; 行連結
(define-key global-map (kbd "M-g")     'goto-line)            ; goto-lineをM-gに
(define-key global-map (kbd "C-c r")   'query-replace-regexp) ; 置換(M-%)キーバインドを(C-c r)にも

(provide 'init-keymap)
