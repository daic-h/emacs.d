(lazyload (ruby-mode) "ruby-mode"
  (defun ruby--encoding-comment-required-p () nil))

(add-hook-fn 'ruby-mode-hook
  (setq ruby-indent-level 2)
  (setq ruby-indent-tabs-mode nil))

(add-auto-mode 'ruby-mode
               "Rakefile\\'" "\\.rake\\'" "\\.rxml\\'"
               "\\.rjs\\'" "\\.irbrc\\'" "\\.pryrc\\'"
               "\\.builder\\'" "\\.ru\\'"
               "\\.gemspec\\'" "Gemfile\\'" "Kirkfile\\'")

(provide 'init-ruby-mode)
