;; vcを起動しないようにする
(setq vc-handled-backends nil)

;; 不要なhookを外す
(remove-hook 'find-file-hook 'vc-find-file-hook)
(remove-hook 'kill-buffer-hook 'vc-kill-buffer-hook)

(provide 'init-vc-mode)
