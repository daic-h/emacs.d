(require 'auto-complete-config)

(setq ac-comphist-file (concat user-emacs-directory "tmp/cache/ac-comphist.dat." (system-name)))
(ac-config-default)
(setq ac-auto-start 2)         ;; n文字以上の単語の時に補完を開始
(setq ac-delay 0.05)           ;; n秒後に補完開始
(setq ac-use-fuzzy t)          ;; 曖昧マッチ有効
(setq ac-use-comphist t)       ;; 補完推測機能有効
(setq ac-use-menu-map t)       ;; 保管メニューの移動
(setq ac-auto-show-menu 0.05)  ;; n秒後に補完メニューを表示
(setq ac-quick-help-delay 0.5) ;; n秒後にクイックヘルプを表示
(setq ac-ignore-case nil)      ;; 大文字・小文字を区別する

(define-key ac-mode-map (kbd "M-TAB") 'auto-complete)  ; M-TABで補完開始

;; 情報源として
;; * ac-source-filename
;; * ac-source-words-in-same-mode-buffers
;; を利用
;;(setq-default ac-sources '(ac-source-filename ac-source-words-in-same-mode-buffers))

(defadvice ac-word-candidates (after remove-word-contain-japanese activate)
  (let ((contain-japanese (lambda (s) (string-match (rx (category japanese)) s))))
    (setq ad-return-value
          (remove-if contain-japanese ad-return-value))))

;; 補完メニューの選択色
(set-face-background 'ac-selection-face "DarkSlateBlue")

(provide 'init-auto-complete)
