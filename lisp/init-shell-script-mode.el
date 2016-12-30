(add-hook-fn 'shell-script-mode-hook
  (setq sh-basic-offset 2)
  (setq sh-indentation 2))

(defvar auto-sh-set-shell-alist '(("\\(?:[.]?bashrc\\|[.]bash_profile\\)\\>" . "bash")
                                  ("\\(?:\\(?:csh\\)?[.]\\(?:cshrc\\|log\\(?:in\\|out\\)\\)\\|[.]tcshrc\\)\\>" . "csh")
                                  ("\\(?:[.]zsh\\|[.]?z\\(?:profile\\|log\\(?:in\\|out\\)\\|sh\\(?:env\\|rc\\)\\)\\)\\>" . "zsh")))
(defun sh-set-shell-advice (forig &rest args)
  (let ((shell (pop args)))
    (when (and (not (called-interactively-p 'any))
               (or (string= "sh" shell) (string= sh-shell-file shell)))
      (setq shell (or (assoc-default buffer-file-name auto-sh-set-shell-alist #'string-match) "sh")))
    (apply forig (cons shell args))))
(advice-add 'sh-set-shell :around #'sh-set-shell-advice)

(add-auto-mode 'shell-script-mode
  "\\.zsh\\'" "\\.zshrc\\'" "\\.zshenv\\'" "\\.sh\\'")

(provide 'init-shell-script-mode)
