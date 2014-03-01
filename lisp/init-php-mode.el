(lazyload (php-mode) "php-mode")

(add-hook-fn 'php-mode-hook
  (require 'php-doc-block)
  (setq indent-tabs-mode nil
  (setq c-basic-offset 4)
  (setq tab-width 4)
  (c-set-offset 'case-label' 4)
  (c-set-offset 'substatement-open 0)
  (define-key php-mode-map (kbd "C-.") 'er/expand-region)
  (define-key php-mode-map (kbd "C-,") 'er/contract-region)
  (define-key php-mode-map (kbd "RET") 'php-doc-block/newline-and-indent)
  (helm-gtags-mode))

(add-auto-mode 'php-mode "\\.php[s345t]?\\'" "\\.phtml\\'" "\\.inc\\'")

(provide 'init-php-mode)
