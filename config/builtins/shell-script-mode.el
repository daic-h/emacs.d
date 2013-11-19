;; indent
(add-hook 'sh-mode-hook
          (lambda () (setq sh-basic-offset 2 sh-indentation 2)))

(add-to-auto-mode-fn 'shell-script-mode
  '(".zsh" ".zshrc"))
