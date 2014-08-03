(setq el-get-dir (expand-file-name "site-lisp/el-get" user-emacs-directory))
(setq el-get-verbose t)

(add-to-list 'load-path (expand-file-name "el-get" el-get-dir))
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

;; personal recipes
(let ((el-get-sources '((:type github :name helm-gtags          :pkgname "syohex/emacs-helm-gtags" :depends helm)
                        (:type github :name helm-swoop          :pkgname "ShingoFukuyama/helm-swoop" :depends helm)
                        (:type github :name helm-ag              :pkgname "syohex/emacs-helm-ag" :depends helm)
                        (:type github :name helm-growthforecast :pkgname "daic-h/helm-growthforecast" :depends helm)
                        (:type github :name rotate              :pkgname "daic-h/emacs-rotate")
                        (:type github :name smooth-scroll       :pkgname "k-talo/smooth-scroll.el")
                        (:type github :name json-reformat       :pkgname "gongo/json-reformat")
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
                        (:type github :name sequential-command  :pkgname "emacsmirror/sequential-command")
                        (:type http-tar :name howm :options ("xzf") :url "http://howm.sourceforge.jp/a/howm-1.4.2.tar.gz"))))
  ;; Packages to install from el-get
  (el-get 'sync (append '(php-mode
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
                          powerline
                          expand-region
                          git-gutter-fringe
                          auto-complete
                          flycheck
                          exec-path-from-shell
                          twittering-mode
                          undohist
                          multiple-cursors
                          region-bindings-mode
                          quickrun
                          flex-autopair
                          auto-highlight-symbol
                          ace-jump-mode
                          apel
                          navi2ch
                          session)
                        (mapcar 'el-get-as-symbol (mapcar 'el-get-source-name el-get-sources)))))

(provide 'init-el-get)
