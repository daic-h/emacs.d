(autoload 'web-mode "web-mode" nil t)

;;; emacs 23以下の互換
(when (< emacs-major-version 24)
  (defalias 'prog-mode 'fundamental-mode))

(add-to-auto-mode-fn 'web-mode  '("\\.html?$" "\\.phtml$"))

(add-hook-fn 'web-mode-hook
  (setq web-mode-html-offset   2)
  (setq web-mode-css-offset    2)
  (setq web-mode-script-offset 2)
  (setq web-mode-php-offset    2)
  (setq web-mode-java-offset   2)
  (setq web-mode-asp-offset    2))
