;; 全角スペース、タブの強調表示
(require 'whitespace)
(setq show-trailing-whitespace t)
(setq whitespace-style '(tab-mark space-mark))
(setq whitespace-space-regexp "\\(\x3000+\\)")
(setq whitespace-display-mappings '((space-mark ?\x3000 [?\□])
                                    (tab-mark ?\t [?\xBB ?\t])))
(global-whitespace-mode 1)

;; 末尾の空白削除
(setq delete-trailing-whitespace-exclude-patterns nil)

(defun delete-trailing-whitespace-with-exclude-pattern ()
  (interactive)
  (if (null delete-trailing-whitespace-exclude-patterns)
      (delete-trailing-whitespace)
    (dolist (pattern delete-trailing-whitespace-exclude-patterns)
      (unless (string-match pattern buffer-file-name)
        (delete-trailing-whitespace)))))

(add-hook 'before-save-hook 'delete-trailing-whitespace-with-exclude-pattern)

;; 末尾の空白を削除しないファイル
(dolist (pattern '("\\.md\\'"))
  (add-to-list 'delete-trailing-whitespace-exclude-patterns pattern))

;; But don't show trailing whitespace in SQLi, inf-ruby etc.
(dolist (hook '(special-mode-hook
                eww-mode-hook
                markdown-mode-hook
                term-mode-hook
                comint-mode-hook
                compilation-mode-hook
                twittering-mode-hook
                minibuffer-setup-hook))
  (add-hook hook (lambda () (setq show-trailing-whitespace nil))))

(custom-set-faces
 '(trailing-whitespace ((t (:foreground "SteelBlue" :underline t)))))

(provide 'init-whitespace)
