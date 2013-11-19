(setq default-directory "~/")

(add-to-list 'load-path user-emacs-directory)

(let ((default-directory (expand-file-name "~/.emacs.d/packages/elisp")))
  (add-to-list 'load-path default-directory)
  (normal-top-level-add-subdirs-to-load-path))

(require 'try-load)

;; マクロ定義
(try-load "config/macros")

;; Emacs本体の設定
(try-load "config/emacs")

;; 標準Elispの設定
(try-load "config/builtins")

;; 非標準Elispの設定
(try-load "config/packages")

;; 個人用の関数
(try-load "config/functions")
