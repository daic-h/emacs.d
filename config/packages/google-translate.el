;; google-translate.el
(require 'google-translate)

;; キーバインドの設定（お好みで）
(global-set-key (kbd "C-c C-t") 'google-translate-at-point)
(global-set-key (kbd "C-c C-c C-t") 'google-translate-at-point-reverse)

;; 翻訳のデフォルト値を設定（ja -> en）
(setq google-translate-default-source-language "ja")
(setq google-translate-default-target-language "en")
