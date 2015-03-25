;; Scss
(lazyload (scss-mode) "scss-mode"
  ;; 自動コンパイルをオフにする
  (setq scss-compile-at-save nil))

(add-auto-mode 'scss-mode "\\.scss\\'")

(provide 'init-scss-mode)
