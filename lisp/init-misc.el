(setq delete-auto-save-files t)
(setq auto-save-default nil)
(setq auto-save-file-name-transforms
      `((".*" ,(expand-file-name "~/.emacs.d/tmp/backup/") t)))
(setq auto-save-list-file-prefix
      (concat user-emacs-directory "tmp/saves/"))

(setq abbrev-file-name (concat user-emacs-directory "tmp/abbrev_defs"))

(setq undo-outer-limit nil)

;; 警告音を消す
(setq ring-bell-function 'ignore)

;; Emacsからの質問を y/n で回答する
(fset 'yes-or-no-p 'y-or-n-p)

;; GCを減らして軽くする
(setq gc-cons-threshold (* 10 gc-cons-threshold))

;; キーストロークのミニバッファへの表示を早く
(setq echo-keystrokes 0.1)

(setq max-lisp-eval-depth 5000)
(setq max-specpdl-size 5000)

(provide 'init-misc)
