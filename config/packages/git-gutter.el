(require 'git-gutter-fringe)

(global-git-gutter-mode t)

;; (add-hook 'git-gutter-mode-on-hook '(lambda () (fringe-mode 0)))

;; (setq git-gutter:window-width 1)

(setq git-gutter:modified-sign " ")
(setq git-gutter:added-sign "+")
(setq git-gutter:deleted-sign "-")

;; (set-face-background 'git-gutter:modified "purple") ;; background color
;; (set-face-foreground 'git-gutter:added "green")
;; (set-face-foreground 'git-gutter:deleted "red")
