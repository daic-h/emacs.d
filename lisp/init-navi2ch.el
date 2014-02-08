(lazyload (navi2ch) "navi2ch")

(add-hook-fn 'navi2ch-before-startup-hook
  (setq navi2ch-article-use-jit t)
  (setq navi2ch-article-auto-range nil))

(provide 'init-navi2ch)
