(setq el-get-dir "~/.el-get"
      el-get-verbose t
      el-get-emacswiki-base-url "http://raw.github.com/emacsmirror/emacswiki.org/master/")

(add-to-list 'load-path (expand-file-name "el-get" el-get-dir))
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))
(require 'el-get)

;; personal recipes
(setq el-get-sources
      '((:type github :name point-undo         :pkgname "emacsmirror/point-undo")
        (:type github :name redo-plus          :pkgname "emacsmirror/redo-plus")
        (:type github :name rotate             :pkgname "daic-h/emacs-rotate")
        (:type github :name sequential-command :pkgname "emacsmirror/sequential-command")
        (:type github :name sudo-ext           :pkgname "emacsmirror/sudo-ext")
        (:type github :name fluentd-mode       :pkgname "syohex/emacs-fluentd-mode")
        (:type github :name helm-pt            :pkgname "ralesi/helm-pt")
        (:type github :name railscasts-theme   :pkgname "itiut/railscasts-theme" :post-init (add-to-list 'custom-theme-load-path default-directory))
        (:type http-tar :name howm :options ("xzf") :url "http://howm.sourceforge.jp/a/howm-1.4.3.tar.gz")))

(let ((builtin-sources '(auto-complete
                         auto-highlight-symbol
                         avy
                         coffee-mode
                         dired-plus
                         dockerfile-mode
                         elscreen
                         exec-path-from-shell
                         expand-region
                         flex-autopair
                         flycheck
                         flycheck-rust
                         git-gutter-fringe
                         go-eldoc
                         go-mode
                         google-translate
                         goto-chg
                         graphviz-dot-mode
                         protobuf-mode
                         haml-mode
                         helm
                         groovy-emacs-mode
                         helm-ag
                         helm-descbinds
                         helm-ghq
                         helm-ls-git
                         helm-swoop
                         ido-vertical-mode
                         js2-mode
                         json-reformat
                         markdown-mode
                         multiple-cursors
                         pcre2el
                         php-mode
                         popwin
                         quickrun
                         rbenv
                         region-bindings-mode
                         rust-mode
                         scss-mode
                         shell-pop
                         slim-mode
                         smooth-scroll
                         toml-mode
                         undohist
                         visual-regexp-steroids
                         volatile-highlights
                         web-mode
                         yaml-mode))
      (personal-sources (mapcar 'el-get-as-symbol (mapcar 'el-get-source-name el-get-sources))))
  (el-get 'sync (append builtin-sources personal-sources)))

(provide 'init-el-get)

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:
