(setq js-indent-level 2)
(setq js2-basic-offset 2)
(setq js2-strict-inconsistent-return-warning nil)

(lazyload (js2-mode) "js2-mode")

(add-auto-mode 'js2-mode "\\.js$")
(add-auto-mode 'js2-jsx-mode "\\.jsx\\'")

(provide 'init-javascript)
