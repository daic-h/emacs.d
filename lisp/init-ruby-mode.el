(lazyload (ruby-mode) "ruby-mode")

(add-hook-fn 'ruby-mode-hook
  (setq ruby-indent-level 2)
  (setq ruby-indent-tabs-mode nil)
  (remove-hook 'before-save-hook 'ruby-mode-set-encoding))

(add-auto-mode 'ruby-mode
               "Rakefile\\'" "\\.rake\\'" "\\.rxml\\'"
               "\\.rjs\\'" "\\.irbrc\\'" "\\.pryrc\\'"
               "\\.builder\\'" "\\.ru\\'"
               "\\.gemspec\\'" "Gemfile\\'" "Kirkfile\\'")

(provide 'init-ruby-mode)
