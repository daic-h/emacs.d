(lazyload (ruby-mode) "ruby-mode"
  (defun ruby--encoding-comment-required-p () nil)

  (require 'rbenv)
  (setq rbenv-show-active-ruby-in-modeline nil)
  (global-rbenv-mode)

  (add-to-list 'electric-pair-pairs '(?| . ?|)))

(add-hook-fn 'ruby-mode-hook
  (setq ruby-indent-level 2)
  (setq ruby-indent-tabs-mode nil))

(add-auto-mode 'ruby-mode
               "\\.rb\\'" "Rakefile\\'" "\\.rake\\'" "\\.rxml\\'"
               "\\.rjs\\'" "\\.irbrc\\'" "\\.pryrc\\'"
               "\\.[mj]?builder\\'" "\\.ru\\'"
               "\\.gemspec\\'" "Gemfile\\'" "Kirkfile\\'")

(provide 'init-ruby-mode)
