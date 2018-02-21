(setq js-indent-level 2)
(setq js2-basic-offset 2)
(setq js2-strict-trailing-comma-warning nil)
(setq js2-strict-inconsistent-return-warning nil)
(setq js2-strict-missing-semi-warning nil)

(lazyload (js2-mode) "js2-mode")

(add-auto-mode 'js2-mode "\\.js$")
(add-auto-mode 'js2-jsx-mode "\\.jsx\\'")

(require 'vue-mode)
(add-to-list 'vue-modes '(:type template :name haml :mode haml-mode))

(require 'prettier-js)

(with-eval-after-load 'js2-mode
  (add-hook 'js2-mode-hook #'add-node-modules-path))

(with-eval-after-load 'vue-mode
  (add-hook 'vue-mode-hook #'add-node-modules-path))

(add-hook 'js2-mode-hook 'prettier-js-mode)
(add-hook 'vue-mode-hook 'prettier-js-mode)

(provide 'init-javascript)
