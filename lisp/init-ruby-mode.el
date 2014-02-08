(lazyload (ruby-mode) "ruby-mode"
  ;; set ruby-mode indent
  (setq ruby-indent-level 2)
  (setq ruby-indent-tabs-mode nil))

(add-hook-fn 'ruby-mode-hook
  (require 'ruby-block)
  (ruby-block-mode t)
  (setq ruby-block-highlight-toggle t)

  (remove-hook 'before-save-hook 'ruby-mode-set-encoding)
  (setq show-trailing-whitespace nil)

  (flymake-mode t))

(add-auto-mode 'ruby-mode
               "Rakefile\\'" "\\.rake\\'" "\\.rxml\\'"
               "\\.rjs\\'" "\\.irbrc\\'" "\\.pryrc\\'"
               "\\.builder\\'" "\\.ru\\'"
               "\\.gemspec\\'" "Gemfile\\'" "Kirkfile\\'")

(provide 'init-ruby-mode)
