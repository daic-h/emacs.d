(autoload 'coffee-mode "coffee-mode" nil t)
(add-to-auto-mode-fn 'coffee-mode
  '("\\.coffee$" "Cakefile"))

(add-hook-fn 'coffee-mode
 (set (make-local-variable 'tab-width) 2))
