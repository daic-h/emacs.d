;; el-bundler
(require 'el-bundler)

(el-bundler:packages
 ;; helm
 (:type "github" :name "emacs-helm/helm")
 (:type "github" :name "emacs-helm/helm-c-moccur")
 (:type "github" :name "emacs-helm/helm-descbinds")
 (:type "github" :name "emacs-helm/helm-ls-git")
 (:type "github" :name "emacs-helm/helm-c-yasnippet")
 (:type "github" :name "daic-h/helm-growthforecast")
;; (:type "github" :name "syohex/emacs-helm-ag")
 (:type "github" :name "syohex/emacs-helm-gtags")

  ;; git-butter
 (:type "github" :name "syohex/emacs-git-gutter")
 (:type "github" :name "syohex/emacs-git-gutter-fringe")
 (:type "github" :name "nschum/fringe-helper.el")

 ;; auto-complete
 (:type "github" :name "auto-complete/fuzzy-el")
 (:type "github" :name "auto-complete/popup-el")
 (:type "github" :name "auto-complete/auto-complete")

 ;; pos-tip
 (:type "github" :name "emacsmirror/pos-tip")
 (:type "github" :name "emacsmirror/popup-pos-tip")

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

 ;; utils
 (:type "github" :name "emacsmirror/revive")
 (:type "github" :name "daic-h/auto-async-byte-compile-mirror")
 (:type "github" :name "hayamiz/twittering-mode")
 (:type "github" :name "capitaomorte/yasnippet")
 (:type "github" :name "m2ym/popwin-el")
 (:type "github" :name "m2ym/undohist-el")
 (:type "github" :name "magnars/multiple-cursors.el")
 (:type "github" :name "fgallina/region-bindings-mode")
 (:type "github" :name "martinp26/goto-chg")
 (:type "github" :name "mooz/emacs-zlc")
 (:type "github" :name "syohex/emacs-quickrun")
 (:type "github" :name "uk-ar/flex-autopair")
 (:type "github" :name "emacsmirror/auto-highlight-symbol")
 (:type "github" :name "jonathanchu/emacs-powerline")
 (:type "github" :name "magnars/expand-region.el")
 (:type "github" :name "id774-2/emacs-w3m")
 (:type "github" :name "k-talo/smooth-scroll.el")
 (:type "github" :name "emacs-jp/elscreen")
 (:type "github" :name "kawaguchi/jaunte.el")
 (:type "github" :name "winterTTr/ace-jump-mode")
 (:type "github" :name "manzyuk/google-translate")
 (:type "github" :name "kbkbkbkb1/guide-key")
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

(el-bundler:configure :dir "~/.emacs.d/packages/bundle" :process-num 3)
(el-bundler:initialize)

;; (elpm-packages
;;  (:type "github" :name "emacs-helm/helm")
;;  (:type "github" :name "emacs-helm/helm-c-moccur")
;;  (:type "github" :name "emacs-helm/helm-descbinds")
;;  (:type "github" :name "emacs-helm/helm-ls-git")
;;  (:type "github" :name "emacs-helm/helm-c-yasnippet")
;;  (:type "github" :name "daic-h/helm-growthforecast")
;;  (:type "github" :name "syohex/emacs-helm-ag")
;;  (:type "github" :name "syohex/emacs-helm-gtags")
;;  (:type "git" :url "git://navi2ch.git.sourceforge.net/gitroot/navi2ch/navi2ch")))

;; (elpm-source :github
;;  (:name "emacs-helm/helm")
;;  (:name "emacs-helm/helm-c-moccur")
;;  (:name "emacs-helm/helm-descbinds")
;;  (:name "emacs-helm/helm-ls-git")
;;  (:name "emacs-helm/helm-c-yasnippet")
;;  (:name "daic-h/helm-growthforecast")
;;  (:name "syohex/emacs-helm-ag")
;;  (:name "syohex/emacs-helm-gtags"))

;; (elpm-sources :git
;;  (:url "git://navi2ch.git.sourceforge.net/gitroot/navi2ch/navi2ch"))
