(lazyload (coffee-mode) "coffee-mode")

(add-auto-mode 'coffee-mode "\\.coffee$" "Cakefile")

(custom-set-variables '(coffee-tab-width 2))

(provide 'init-coffee-mode)
