(require 'popwin)
(setq display-buffer-function 'popwin:display-buffer)

;; dired
(push '(dired-mode :position top)
      popwin:special-display-config)

;; compile
(push '("*Compile-Log*" :height 20 :noselect t)
      popwin:special-display-config)

;; backtrace
(push '("*Backtrace*" :height 20 :noselect t)
      popwin:special-display-config)

;; helm
(push '("^\*helm.+\*$" :regexp t :height 20)
      popwin:special-display-config)

;; twittering mode
(push '(":home" :height 25)
      popwin:special-display-config)

;; auto-async-byte-compile
(push '(" *auto-async-byte-compile*" :height 14 :noselect t :position bottom)
      popwin:special-display-config)

;; google-translate
(push '("*Google Translate*" :height 14 :noselect t :position bottom)
      popwin:special-display-config)

;; quickrun
(push '("*quickrun*" :height 25 :noselect t :position bottom)
      popwin:special-display-config)

(global-set-key (kbd "C-x C-p") popwin:keymap)

;; twittering-modeをpopup
;; (global-set-key (kbd "C-x t")
;;  (lambda ()
;;    (interactive)
;;    (if (get-buffer ":home") (display-buffer ":home") (twit))))

(provide 'init-popwin)
