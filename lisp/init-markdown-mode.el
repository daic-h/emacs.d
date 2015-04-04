(lazyload (markdown-mode) "markdown-mode")

(dolist (pattern '("\\.md$" "\\.markdown$"))
  (add-to-list 'delete-trailing-whitespace-exclude-patterns pattern))

(provide 'init-markdown-mode)
