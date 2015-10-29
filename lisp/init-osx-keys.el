(when *is-a-mac*
  (setq ns-command-modifier 'meta)
  (setq ns-alternate-modifier 'super)
  (setq ns-right-command-modifier 'hyper)
  ;; (setq ns-right-alternate-modifier 'alt)

  (setq mac-pass-control-to-system nil)
  (setq mac-pass-command-to-system nil)
  (setq mac-pass-option-to-system nil)

  ;; Make mouse wheel / trackpad scrolling less jerky
  (setq mouse-wheel-scroll-amount '(1 ((shift) . 5) ((control))))
  ;; スクロールの加速をOFF
  (setq mouse-wheel-progressive-speed nil)
  ;; Macの場合、スクロールをなめらかにする
  (setq mac-mouse-wheel-smooth-scroll t)

  (setq default-input-method "MacOSX")

  (when (fboundp 'mac-set-input-method-parameter)
    (mac-set-input-method-parameter
     "com.google.inputmethod.Japanese.base" 'title "あ")
    ;; カーソルの色
    (mac-set-input-method-parameter
     "com.apple.keylayout.US" 'cursor-color (face-attribute 'cursor :background))
    (mac-set-input-method-parameter
     "com.google.inputmethod.Japanese.base" 'cursor-color "red")
    ;; emacs 起動時は英数モードから始める
    (add-hook 'after-init-hook 'mac-change-language-to-us)
    ;; backslash を優先
    (mac-translate-from-yen-to-backslash)
    ;; minibuffer 内は英数モードにする
    (add-hook 'minibuffer-setup-hook 'mac-change-language-to-us)
    ;; [migemo]isearch のとき IME を英数モードにする
    (add-hook 'isearch-mode-hook 'mac-change-language-to-us)))

(provide 'init-osx-keys)
