;; ;; Yasnippet
;; ;;_______________________________________________________________
(require 'yasnippet)

(setq yas-snippet-dirs
      '("~/.emacs.d/config/snippets"
        "~/.emacs.d/packages/bundle/yasnippet/snippets"))

(yas-global-mode 1)

(custom-set-variables '(yas-trigger-key "TAB"))
