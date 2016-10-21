(add-auto-mode 'go-mode "\\.go$")

(lazyload (go-mode) "go-mode")

(add-hook-fn 'go-mode-hook
  (setq c-basic-offset 4)
  (setq indent-tabs-mode t)
  ;; (setq gofmt-command "gofmt")
  (go-eldoc-setup)
  (add-hook 'before-save-hook 'gofmt-before-save)
  (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)
  (local-set-key (kbd "C-c i") 'go-goto-imports)
  (local-set-key (kbd "C-c d") 'godoc)
  (local-set-key (kbd "C-c C-b") 'pop-tag-mark))

(provide 'init-go-mode)
