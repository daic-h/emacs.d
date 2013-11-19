(autoload 'go-mode "go-mode" nil t)

(add-hook-fn 'go-mode-hook
 (setq c-basic-offset 4)
 (setq indent-tabs-mode t)
 (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)
 (local-set-key (kbd "C-c i") 'go-goto-imports)
 (local-set-key (kbd "C-c d") 'godoc)
 ;; Goはタブ使うのでしょうがなく
 (face-remap-add-relative 'my-face-b-2 '(:background nil)) )

(add-to-auto-mode-fn 'go-mode '("\\.go$"))
