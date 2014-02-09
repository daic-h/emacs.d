;; Emacsからの質問を y/n で回答する
(fset 'yes-or-no-p 'y-or-n-p)

;; GCを減らして軽くする
(setq gc-cons-threshold (* 10 gc-cons-threshold))

(setq max-lisp-eval-depth 5000)
(setq max-specpdl-size 5000)

(provide 'init-misc)
