(lazyload (markdown-mode) "markdown-mode")

(add-hook 'markdown-mode-hook
          '(lambda ()
             (set (make-local-variable 'whitespace-action) nil)))

(provide 'init-markdown-mode)
