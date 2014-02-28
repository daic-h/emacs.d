(setq el-get-dir (concat user-emacs-directory  "site-lisp/el-get/"))
(setq el-get-verbose t)

(add-to-list 'load-path (concat user-emacs-directory  "site-lisp/el-get/el-get/"))
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

;; personal recipes
(setq el-get-sources
      '((:type github :name helm-gtags          :pkgname "syohex/emacs-helm-gtags")
        (:type github :name helm-swoop          :pkgname "ShingoFukuyama/helm-swoop")
        (:type github :name helm-growthforecast :pkgname "daic-h/helm-growthforecast")
        (:type github :name emacs-w3m           :pkgname "id774-2/emacs-w3m" :compile nil)
        (:type github :name rotate              :pkgname "daic-h/emacs-rotate")
        (:type github :name smooth-scroll       :pkgname "k-talo/smooth-scroll.el")
        (:type github :name elscreen            :pkgname "emacs-jp/elscreen")
        (:type github :name jaunte              :pkgname "kawaguchi/jaunte.el")
        (:type github :name google-translate    :pkgname "manzyuk/google-translate")
        (:type github :name guide-key           :pkgname "kbkbkbkb1/guide-key")
        (:type github :name popwin              :pkgname "m2ym/popwin-el" :load-path ("." "misc") :compile nil)
        (:type github :name goto-chg            :pkgname "emacsmirror/goto-chg")
        (:type github :name dired-plus          :pkgname "emacsmirror/dired-plus")
        (:type github :name redo-plus           :pkgname "emacsmirror/redo-plus")
        (:type github :name session             :pkgname "emacsmirror/session")
        (:type github :name shell-pop           :pkgname "emacsmirror/shell-pop")
        (:type github :name point-undo          :pkgname "emacsmirror/point-undo")
        (:type github :name sudo-ext            :pkgname "emacsmirror/sudo-ext")
        (:type github :name multi-term          :pkgname "emacsmirror/multi-term")
        (:type github :name sequential-command  :pkgname "emacsmirror/sequential-command")))

(setq my/el-get-packages '(php-mode
                           js2-mode
                           scala-mode2
                           coffee-mode
                           go-mode
                           web-mode
                           haml-mode
                           yaml-mode
                           scss-mode
                           helm
                           helm-descbinds
                           helm-ls-git
                           helm-gtags
                           helm-swoop
                           helm-growthforecast
                           expand-region
                           git-gutter-fringe
                           auto-complete
                           flycheck
                           exec-path-from-shell
                           twittering-mode
                           emacs-w3m
                           popwin
                           undohist
                           multiple-cursors
                           region-bindings-mode
                           goto-chg
                           quickrun
                           flex-autopair
                           auto-highlight-symbol
                           ace-jump-mode
                           dired-plus
                           apel
                           navi2ch
                           redo-plus
                           session
                           point-undo
                           rotate
                           elscreen
                           smooth-scroll
                           jaunte
                           google-translate
                           guide-key
                           sudo-ext
                           multi-term
                           sequential-command))

;; Packages to install from el-get
(el-get 'sync my/el-get-packages)

(provide 'init-el-get)
