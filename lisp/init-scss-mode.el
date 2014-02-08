;; Scss
(lazyload (scss-mode) "scss-mode"
 ;; 自動コンパイルをオフにする
 ;; (setq scss-compile-at-save nil)
          )
(add-to-auto-mode-fn 'scss-mode '("\\.scss\\'"))
