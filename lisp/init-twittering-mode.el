(lazyload (twit) "twittering-mode"
  (setq twittering-auth-method 'xauth))

(add-hook 'twittering-mode-hook
 (lambda ()
   (setq twittering-status-format "%i %s / %S,  %@:\n%FILL[  ]{%T // from %f%L%r%R}")
   (set-face-bold-p 'twittering-username-face t)
   (set-face-foreground 'twittering-username-face "DeepSkyBlue3")
   (set-face-foreground 'twittering-uri-face "gray60")
   ;; (setq twittering-status-format "%i %p%s / %S:\n%FOLD{%T}\n%r %R [%@]")
   (setq twittering-retweet-format " RT @%s: %t")
   ;;60秒ごとにタイムラインを更新する
   (setq twittering-timer-interval 60)
   ;; "F"でお気に入り
   (define-key twittering-mode-map (kbd "F") 'twittering-favorite)
   ;; "R"でリツイートできるようにする
   (define-key twittering-mode-map (kbd "R") 'twittering-native-retweet)
   ;; "<"">"で先頭、最後尾にいけるように
   (define-key twittering-mode-map (kbd "<")
     (lambda () (interactive) (goto-char (point-min))))
   (define-key twittering-mode-map (kbd ">")
     (lambda () (interactive) (goto-char (point-max))))))

(provide 'init-twittering-mode)
