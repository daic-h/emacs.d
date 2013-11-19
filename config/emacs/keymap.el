;;
;; Global key bind
;;________________________________________________________________
(define-key global-map (kbd "C-c a")   'align-regexp)
(define-key global-map (kbd "M-<RET>") 'ns-toggle-fullscreen) ; フルスクリーン設定
(define-key global-map (kbd "M-?")     'help-for-help)        ; helpをメタ+?に
(define-key global-map (kbd "C-h")     'delete-backward-char) ; C-hにバックスペース
(define-key global-map (kbd "C-m")     'newline-and-indent)   ; 改行にインデントを追加
(define-key global-map (kbd "C-S-i")   'indent-region)        ; リージョンをインデント
(define-key global-map [?¥] [?\\])                            ; ¥の代わりにバックスラッシュを入力する
(define-key global-map (kbd "C-j")     'delete-indentation)   ; 行連結
(define-key global-map (kbd "M-g")     'goto-line)            ; goto-lineをM-gに
(define-key global-map (kbd "C-c r")   'query-replace-regexp) ; 置換(M-%)キーバインドを(C-c r)にも
;; (define-key global-map (kbd "C-:")     'dabbrev-expand)    ; 高性能補完
(define-key global-map (kbd "C-o")     'hippie-expand)        ; 高性能補完
(setq hippie-expand-try-functions-list
      '(try-expand-dabbrev
        try-expand-dabbrev-all-buffers
        try-expand-dabbrev-from-kill
        try-complete-file-name-partially
        try-complete-file-name
        try-expand-all-abbrevs
        try-expand-list
        try-expand-line
        try-complete-lisp-symbol-partially
        try-complete-lisp-symbol))
