(autoload 'navi2ch "navi2ch" nil t)
(add-hook-fn 'navi2ch-before-startup-hook
  (setq navi2ch-article-use-jit t)
  (setq navi2ch-article-auto-range nil))
