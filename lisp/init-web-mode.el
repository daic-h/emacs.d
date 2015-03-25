(lazyload (web-mode) "web-mode")

(add-hook-fn 'web-mode-hook
  (setq web-mode-indent-style 2)
  (setq web-mode-attr-indent-offset 2)
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2))

(add-auto-mode'web-mode "\\.html?$" "\\.phtml$" "\\.erb$")

(provide 'init-web-mode)
