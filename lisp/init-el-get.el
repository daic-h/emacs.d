(setq el-get-dir (expand-file-name "site-lisp/el-get" user-emacs-directory))
(setq el-get-verbose t)
(setq-default el-get-emacswiki-base-url "http://raw.github.com/emacsmirror/emacswiki.org/master/")

(add-to-list 'load-path (expand-file-name "el-get" el-get-dir))
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

;; personal recipes
(let ((el-get-sources '((:type github :name helm-growthforecast :pkgname "daic-h/helm-growthforecast")
                        (:type github :name rotate              :pkgname "daic-h/emacs-rotate")
                        (:type github :name smooth-scroll       :pkgname "k-talo/smooth-scroll.el")
                        (:type github :name json-reformat       :pkgname "gongo/json-reformat")
                        (:type github :name elscreen            :pkgname "emacs-jp/elscreen")
                        (:type github :name jaunte              :pkgname "kawaguchi/jaunte.el")
                        (:type github :name google-translate    :pkgname "manzyuk/google-translate")
                        (:type github :name goto-chg            :pkgname "emacsmirror/goto-chg")
                        (:type github :name dired-plus          :pkgname "emacsmirror/dired-plus")
                        (:type github :name redo-plus           :pkgname "emacsmirror/redo-plus")
                        (:type github :name shell-pop           :pkgname "emacsmirror/shell-pop")
                        (:type github :name point-undo          :pkgname "emacsmirror/point-undo")
                        (:type github :name sudo-ext            :pkgname "emacsmirror/sudo-ext")
                        (:type github :name multi-term          :pkgname "emacsmirror/multi-term")
                        (:type github :name sequential-command  :pkgname "emacsmirror/sequential-command")
                        (:type http-tar :name howm :options ("xzf") :url "http://howm.sourceforge.jp/a/howm-1.4.2.tar.gz")))
      (el-get-builtin-sources '(php-mode
                                js2-mode
                                scala-mode2
                                coffee-mode
                                go-mode
                                web-mode
                                haml-mode
                                yaml-mode
                                scss-mode
                                markdown-mode
                                rbenv
                                helm
                                helm-descbinds
                                helm-ls-git
                                helm-swoop
                                helm-ag
                                helm-gtags
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
                                navi2ch
                                visual-regexp
                                popwin
                                volatile-highlights)))
  ;; Packages to install from el-get
  (el-get 'sync (append el-get-builtin-sources
                        (mapcar 'el-get-as-symbol (mapcar 'el-get-source-name el-get-sources)))))

(provide 'init-el-get)
