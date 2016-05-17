(lazyload (go-mode) "go-mode"
  (require 'go-autocomplete)
  (add-hook 'before-save-hook 'gofmt-before-save))

(add-hook-fn 'go-mode-hook
  (setq c-basic-offset 4)
  (setq indent-tabs-mode t)
  (go-eldoc-setup)
  ;; (setq gofmt-command "goimports")

  (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)
  (local-set-key (kbd "C-c i") 'go-goto-imports)
  (local-set-key (kbd "C-c d") 'godoc)
  (local-set-key (kbd "C-c C-b") 'godef-jump-back))

(add-auto-mode 'go-mode "\\.go$")

(provide 'init-go-mode)
