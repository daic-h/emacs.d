(lazyload (web-mode) "web-mode")

(add-hook-fn 'web-mode-hook
  (setq web-mode-html-offset   2)
  (setq web-mode-css-offset    2)
  (setq web-mode-script-offset 2)
  (setq web-mode-php-offset    2)
  (setq web-mode-java-offset   2)
  (setq web-mode-asp-offset    2))

(add-auto-mode'web-mode "\\.html?$" "\\.phtml$")

(provide 'init-web-mode)
