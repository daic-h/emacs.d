(set-frame-parameter (selected-frame) 'alpha '(95 95))   ;; 透明度 (active . inactive)
(scroll-bar-mode -1)                                     ;; スクロールバー非表示
(tool-bar-mode 0)                                        ;; ツールバー非表示
(column-number-mode t)                                   ;; カーソルの位置が何文字目なのかを表示
(global-font-lock-mode t)                                ;; 文字の色づけ
(setq transient-mark-mode t)                             ;; highlight reagion
(show-paren-mode 1)                                      ;; 対応する括弧を光らせる
(windmove-default-keybindings)                           ;; Shift + 矢印で画面移動

;; nice scrolling
(setq scroll-margin 0
      scroll-conservatively 100000
      scroll-preserve-screen-position 1)
(global-hl-line-mode 0)                                ;; 編集行のハイライトしない
;; (setq hl-line-face 'underline)                      ;; 下線
(blink-cursor-mode 0)

(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))    ;; マウススクロールを1行単位
(setq mouse-wheel-progressive-speed nil)               ;; スクロールの加速をOFF
(when ns-p (setq mac-mouse-wheel-smooth-scroll t))     ;; Macの場合、スクロールをなめらかにする

;; 時計表示
(setq display-time-string-forms '(" " month "/" day " " dayname " " 24-hours ":" minutes))
(display-time)


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

;; ハイライト変更
(defun font-lock-user-keywords (mode &optional keywords)
  "Add user highlighting to KEYWORDS to MODE.
See `font-lock-add-keywords' and `font-lock-defaults'."
  (unless mode
    (error "mode should be non-nil "))
  (font-lock-remove-keywords mode (get mode 'font-lock-user-keywords))
  (font-lock-add-keywords mode keywords)
  (put mode 'font-lock-user-keywords keywords))

(setq frame-title-format
      '((:eval (if (buffer-file-name)
                   (abbreviate-file-name (buffer-file-name))
                 "%b"))))
