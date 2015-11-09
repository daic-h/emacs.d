;;
;; descbinds
;;
(require 'helm-descbinds)
(helm-descbinds-mode 1)

;;
;; helm-gtags
;;
(lazyload (helm-gtags-mode) "helm-gtags"
  ;; customize
  (setq helm-gtags-path-style 'relative)
  (setq helm-gtags-ignore-case t)
  (setq helm-gtags-read-only nil)
  ;; key bindings
  (local-set-key (kbd "M-t") 'helm-gtags-find-tag)
  (local-set-key (kbd "M-r") 'helm-gtags-find-rtag)
  (local-set-key (kbd "M-s") 'helm-gtags-find-symbol)
  (local-set-key (kbd "C-t") 'helm-gtags-pop-stack))

;;
;; helm-swoop
;;
(lazyload (helm-swoop helm-multi-swoop helm-multi-swoop-all) "helm-swoop")
(global-set-key (kbd "M-i") 'helm-swoop)
(global-set-key (kbd "C-c M-i") 'helm-multi-swoop)
(global-set-key (kbd "C-x M-i") 'helm-multi-swoop-all)

;;
;; helm-ls-git
;;
(lazyload (helm-ls-git-ls) "helm-ls-git")
(global-set-key (kbd "C-'") 'helm-ls-git-ls)

;;
;; helm-growthforecast
;;
(lazyload (helm-growthforecast) "helm-growthforecast"
  (setq helm-growthforecast-complex-params
        '(("t" . "sh")
          ("sumup" . "0")
          ("border" . "0")
          ("legend" . "0")
          ("width". "300")
          ("background_color". "333333")
          ("canvas_color". "333333")
          ("font_color"."CCCCCC")
          ("axis_color". "666666")))

  (setq helm-growthforecast-graph-params
        helm-growthforecast-complex-params))

;;
;; helm-ag
;;
(lazyload (helm-ag) "helm-ag"
  (setq helm-ag-source-type 'one-line))
(global-set-key (kbd "C-c C-'") 'helm-ag)
(global-set-key (kbd "C-c C-t") 'helm-ag-pop-stack)

(provide 'init-helm-ext)
