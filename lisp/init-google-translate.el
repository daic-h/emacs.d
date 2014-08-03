(lazyload (google-translate-at-point google-translate-at-point-reverse) "google-translate"
  ;; 翻訳のデフォルト値を設定 (en -> ja)
  (setq google-translate-default-source-language "en")
  (setq google-translate-default-target-language "ja"))

;; キーバインドの設定（お好みで）
(global-set-key (kbd "C-c C-t") 'google-translate-at-point)
(global-set-key (kbd "C-c C-c C-t") 'google-translate-at-point-reverse)

(provide 'init-google-translate)
