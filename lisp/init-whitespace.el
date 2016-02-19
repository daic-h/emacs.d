;; 全角スペース、タブの強調表示

(require 'whitespace)
(require 'cl)
(setq whitespace-style '(tab-mark space-mark))
(setq whitespace-space-regexp "\\(\x3000+\\)")
;; (setq whitespace-display-mappings '((space-mark ?\x3000 [?\□])
;;                                     (tab-mark ?\t [?\xBB ?\t])))
(setq whitespace-display-mappings '((space-mark ?\x3000 [?\□])))
(global-whitespace-mode 1)


;; 末尾の空白の可視化 (whitespace-modeではタブと全角のみ行う)

(setq-default show-trailing-whitespace t)

;; 末尾の空白を表示しないモード
(dolist (hook '(special-mode-hook
                eww-mode-hook
                markdown-mode-hook
                term-mode-hook
                comint-mode-hook
                compilation-mode-hook
                twittering-mode-hook
                minibuffer-setup-hook))
  (add-hook hook (lambda ()
                   (setq show-trailing-whitespace nil))))

(custom-set-faces
 '(trailing-whitespace ((t (:foreground "SteelBlue" :underline t)))))


;; 末尾の空白削除

(defvar delete-trailing-whitespace-exclude-patterns nil)

(defun delete-trailing-whitespace-with-exclude-pattern ()
  (interactive)
  (if (null delete-trailing-whitespace-exclude-patterns)
      (delete-trailing-whitespace)
    (unless (loop for x in delete-trailing-whitespace-exclude-patterns
                  thereis (string-match x buffer-file-name))
      (delete-trailing-whitespace))))

(add-hook 'before-save-hook 'delete-trailing-whitespace-with-exclude-pattern)

;; 末尾の空白を削除しないファイル
(dolist (pattern '("\\.md\\'"))
  (add-to-list 'delete-trailing-whitespace-exclude-patterns pattern))

(provide 'init-whitespace)
