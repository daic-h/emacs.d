(add-hook-fn 'shell-script-mode-hook
  (setq sh-basic-offset 2 sh-indentation 2))

(add-auto-mode 'shell-script-mode
  ".zsh" ".zshrc" ".zshenv" ".sh")

(provide 'init-shell-script-mode)
