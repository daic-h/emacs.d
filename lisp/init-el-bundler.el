(require 'el-bundler)

(el-bundler:packages
 ;; develop mode
 (:type "github" :name "ejmr/php-mode")
 (:type "github" :name "mooz/js2-mode")
 (:type "github" :name "hvesalai/scala-mode2")
 (:type "github" :name "defunkt/coffee-mode")
 (:type "github" :name "eschulte/rinari")
 (:type "github" :name "eschulte/rhtml")
 (:type "github" :name "fxbois/web-mode")
 (:type "github" :name "nex3/haml-mode")
 (:type "github" :name "antonj/scss-mode")
 (:type "github" :name "yoshiki/yaml-mode")
 (:type "github" :name "dominikh/go-mode.el")

 ;; helm
 (:type "github" :name "emacs-helm/helm")
 (:type "github" :name "emacs-helm/helm-descbinds")
 (:type "github" :name "emacs-helm/helm-ls-git")
 (:type "github" :name "syohex/emacs-helm-gtags")
 (:type "github" :name "ShingoFukuyama/helm-swoop")
 (:type "github" :name "daic-h/helm-growthforecast")

  ;; git-butter
 (:type "github" :name "syohex/emacs-git-gutter")
 (:type "github" :name "syohex/emacs-git-gutter-fringe")
 (:type "github" :name "nschum/fringe-helper.el")

 ;; auto-complete
 (:type "github" :name "auto-complete/fuzzy-el")
 (:type "github" :name "auto-complete/popup-el")
 (:type "github" :name "auto-complete/auto-complete")

 ;; flycheck
 (:type "github" :name "magnars/s.el")
 (:type "github" :name "magnars/dash.el")
 (:type "github" :name "rejeep/f.el")
 (:type "github" :name "flycheck/flycheck")

 ;; utils
 (:type "github" :name "purcell/exec-path-from-shell")
 (:type "github" :name "daic-h/emacs-rotate")
 (:type "github" :name "hayamiz/twittering-mode")
 (:type "github" :name "m2ym/popwin-el")
 (:type "github" :name "m2ym/undohist-el")
 (:type "github" :name "magnars/multiple-cursors.el")
 (:type "github" :name "fgallina/region-bindings-mode")
 (:type "github" :name "martinp26/goto-chg")
 (:type "github" :name "syohex/emacs-quickrun")
 (:type "github" :name "uk-ar/flex-autopair")
 (:type "github" :name "emacsmirror/auto-highlight-symbol")
 (:type "github" :name "magnars/expand-region.el")
 (:type "github" :name "id774-2/emacs-w3m")
 (:type "github" :name "k-talo/smooth-scroll.el")
 (:type "github" :name "emacs-jp/elscreen")
 (:type "github" :name "kawaguchi/jaunte.el")
 (:type "github" :name "winterTTr/ace-jump-mode")
 (:type "github" :name "manzyuk/google-translate")
 (:type "github" :name "kbkbkbkb1/guide-key")
 (:type "github" :name "emacsmirror/dired-plus")
 (:type "github" :name "emacsmirror/session")
 (:type "github" :name "emacsmirror/shell-pop")
 (:type "github" :name "emacsmirror/redo-plus")
 (:type "github" :name "emacsmirror/point-undo")
 (:type "github" :name "emacsmirror/apel")
 (:type "github" :name "emacsmirror/ruby-block")
 (:type "github" :name "emacsmirror/sudo-ext")
 (:type "github" :name "emacsmirror/multi-term")
 (:type "github" :name "emacsmirror/grep-edit")
 (:type "github" :name "emacsmirror/sequential-command")
 (:type "github" :name "emacsmirror/color-moccur")
 (:type "github" :name "emacsmirror/multi-term")
 (:type "git" :url "git://navi2ch.git.sourceforge.net/gitroot/navi2ch/navi2ch"))

(el-bundler:configure :dir (concat user-emacs-directory "site-lisp/bundle") :process-num 3)
(el-bundler:initialize)

(provide 'init-el-bundler)
