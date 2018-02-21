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
      '((:type github :name point-undo            :pkgname "emacsmirror/point-undo")
        (:type github :name redo-plus             :pkgname "emacsmirror/redo-plus")
        (:type github :name sequential-command    :pkgname "rubikitch/sequential-command")
        (:type github :name sudo-ext              :pkgname "emacsmirror/sudo-ext")
        (:type github :name no-littering          :pkgname "emacscollective/no-littering")
        (:type github :name rotate                :pkgname "daichirata/emacs-rotate")
        (:type github :name fluentd-mode          :pkgname "syohex/emacs-fluentd-mode")
        (:type github :name helm-pt               :pkgname "ralesi/helm-pt")
        (:type github :name doom-theme            :pkgname "hlissner/emacs-doom-theme")
        (:type github :name rufo                  :pkgname "danielma/rufo.el")
        (:type github :name add-node-modules-path :pkgname "codesuki/add-node-modules-path")
        (:type github :name spacemacs-theme       :pkgname "nashamri/spacemacs-theme" :post-init (add-to-list 'custom-theme-load-path default-directory))
        (:type github :name railscasts-theme      :pkgname "itiut/railscasts-theme"   :post-init (add-to-list 'custom-theme-load-path default-directory))
        (:type http-tar :name howm :options ("xzf") :url "http://howm.sourceforge.jp/a/howm-1.4.3.tar.gz")))

(let ((builtin-sources '(
                         auto-complete
                         auto-highlight-symbol
                         avy
                         coffee-mode
                         dired-plus
                         direx
                         dockerfile-mode
                         elscreen
                         emacs-async
                         expand-region
                         flycheck
                         flycheck-rust
                         git-commit-mode
                         git-gutter-fringe
                         go-eldoc
                         go-mode
                         google-translate
                         goto-chg
                         graphviz-dot-mode
                         groovy-emacs-mode
                         haml-mode
                         helm
                         helm-ag
                         helm-descbinds
                         helm-ghq
                         helm-ls-git
                         helm-swoop
                         ido-vertical-mode
                         jinja2-mode
                         js2-mode
                         json-reformat
                         lua-mode
                         markdown-mode
                         multiple-cursors
                         no-littering
                         pcre2el
                         php-mode
                         popwin
                         powerline
                         prettier-js
                         protobuf-mode
                         quickrun
                         rbenv
                         region-bindings-mode
                         rust-mode
                         shell-pop
                         slim-mode
                         smartparens
                         spaceline
                         toml-mode
                         undohist
                         visual-regexp-steroids
                         volatile-highlights
                         web-mode
                         yaml-mode
                         ))
      (personal-sources (mapcar 'el-get-as-symbol (mapcar 'el-get-source-name el-get-sources))))
  (el-get 'sync (append builtin-sources personal-sources)))

(provide 'init-el-get)

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:
