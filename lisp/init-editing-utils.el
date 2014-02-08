;; バックアップファイルを自動て作らない
(setq make-backup-files nil)
(setq backup-directory-alist
      (list (cons ""  (concat user-emacs-directory "tmp/backup"))))

;; 末尾の空白をbefore-save-hookで削除
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; tabは4文字分、改行後に自動インデント
(setq-default tab-width 4 indent-tabs-mode nil)

;; 改行にインデントを追加
(define-key global-map (kbd "RET") 'newline-and-indent)

;; 行の先頭でC-kを一回押すだけで行全体を消去する
(setq kill-whole-line t)

;; 編集行のハイライトしない
;; (global-hl-line-mode 0)
;; 下線
;; (setq hl-line-face 'underline)
(blink-cursor-mode 0)

;; カーソルの位置が何文字目なのかを表示
(column-number-mode t)

;; highlight reagion
(setq transient-mark-mode t)

;; 対応する括弧を光らせる
(show-paren-mode 1)

;; nice scrolling
(setq scroll-margin 0
      scroll-conservatively 100000
      scroll-preserve-screen-position 1)

;; 全角スペース、タブの強調表示
(defface my-face-b-1 '((t (:background "medium aquamarine"))) nil :group 'my-face)
(defface my-face-b-2 '((t (:background "medium aquamarine"))) nil :group 'my-face)
(defface my-face-u-1 '((t (:foreground "SteelBlue" :underline t))) nil :group 'my-face)
(defvar  my-face-b-1 'my-face-b-1)
(defvar  my-face-b-2 'my-face-b-2)
(defvar  my-face-u-1 'my-face-u-1)
(make-variable-buffer-local 'my-face-b-1)
(make-variable-buffer-local 'my-face-b-2)
(make-variable-buffer-local 'my-face-u-1)

(defadvice font-lock-mode (before my-font-lock-mode ())
  (font-lock-add-keywords major-mode '(("　"    0 my-face-b-1 append)
                                       ("\t"    0 my-face-b-2 append)
                                       ("[ ]+$" 0 my-face-u-1 append))))

(defun font-lock-mode-fn ()
  (if font-lock-mode nil (font-lock-mode t)))

(ad-activate 'font-lock-mode)
(ad-enable-advice 'font-lock-mode 'before 'my-font-lock-mode)
(add-hook 'find-file-hooks 'font-lock-mode-fn t)

(provide 'init-editing-utils)
