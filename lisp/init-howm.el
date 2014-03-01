(lazyload (howm-menu howm-create) "howm"
  (set-face-background 'howm-view-name-face "DimGray"))

(define-key global-map (kbd "C-c , ,") 'howm-menu)

(setq howm-directory (concat user-emacs-directory "howm/memo")
      howm-menu-lang 'ja
      howm-menu-top nil
      howm-file-name-format "%Y%m%d-%H%M%S.howm"
      ;; 読み書き共通
      howm-process-coding-system 'utf-8-unix
      ;; メニューと履歴を検索対象から除外するために別ディレクトリへ
      howm-keyword-file (concat user-emacs-directory "howm/keys")
      howm-history-file (concat user-emacs-directory "howm/history")
      howm-menu-file    (concat user-emacs-directory "howm/menu")
      ;; 検索時に大文字と小文字を区別しない
      howm-keyword-case-fold-search t
      ;; 一覧にタイトル表示しない
      howm-list-title nil
      ;; save 時にメニューを更新しない
      howm-menu-refresh-after-save nil
      howm-refresh-after-save nil
      ;; RET でファイルを開く際, 一覧バッファを消す. C-u RET なら残る
      howm-view-summary-persistent nil
      ;; 新規メモを上に
      howm-prepend t
      ;; 全メモ一覧時にタイトル表示
      howm-list-all-title t
      ;;「最近のメモ」一覧時にタイトル表示
      howm-list-recent-title t
      ;; 「最近のメモ」の表示件数
      howm-menu-recent-num 15
      ;; メニューを 2 時間キャッシュ
      howm-menu-expiry-hours 2)

(provide 'init-howm)
