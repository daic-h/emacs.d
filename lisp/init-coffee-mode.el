(lazyload (coffee-mode) "coffee-mode")

(add-auto-mode 'coffee-mode "\\.coffee$" "Cakefile")

(add-hook-fn 'coffee-mode
             (set (make-local-variable 'tab-width) 2))

(provide 'init-coffee-mode)
