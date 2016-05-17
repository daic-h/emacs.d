;;; This file bootstraps the configuration, which is divided into
;;; a number of other files.
(let ((minver 24))
  (unless (>= emacs-major-version minver)
    (error "Your Emacs is too old -- this config requires v%s or higher" minver)))

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(require 'init-benchmarking) ;; Measure startup time

(defconst *is-a-mac* (eq system-type 'darwin))

;;----------------------------------------------------------------------------
;; Bootstrap config
;;----------------------------------------------------------------------------
(require-init 'init-path)
(require-init 'init-utils)
(require-init 'init-site-lisp)
(require-init 'init-el-get)
;; (require-init 'init-exec-path)
(require-init 'init-directory)

;;----------------------------------------------------------------------------
;; Load configs for specific features and modes
;;----------------------------------------------------------------------------
(require-init 'init-themes)
(require-init 'init-modeline)
(require-init 'init-osx-keys)
(require-init 'init-gui-frames)
(require-init 'init-whitespace)
(require-init 'init-dired)
(require-init 'init-uniquify)
(require-init 'init-flycheck)
(require-init 'init-vc-mode)
(require-init 'init-tramp)

(require-init 'init-helm)
(require-init 'init-helm-ext)
(require-init 'init-recentf)
(require-init 'init-ido)
(require-init 'init-hippie-expand)
(require-init 'init-auto-complete)
(require-init 'init-fonts)
(require-init 'init-windows)
(require-init 'init-visual-regexp)

(require-init 'init-howm)
(require-init 'init-redo)
(require-init 'init-undohist)
(require-init 'init-expand-region)
(require-init 'init-multiple-cursors)
(require-init 'init-auto-highlight-symbol)
(require-init 'init-sequential-command)
(require-init 'init-cua-mode)
(require-init 'init-diff-mode)
(require-init 'init-smooth-scroll)
(require-init 'init-flex-autopair)
;; (require-init 'init-point-undo)
(require-init 'init-goto-chg)
(require-init 'init-eww)

(require-init 'init-editing-utils)
(require-init 'init-volatile-highlights)
(require-init 'init-git)
(require-init 'init-git-gutter)

(require-init 'init-popwin)
(require-init 'init-jaunte)
(require-init 'init-rotate)
(require-init 'init-elscreen)
(require-init 'init-quickrun)

(require-init 'init-cc-mode)
(require-init 'init-shell-script-mode)
(require-init 'init-ruby-mode)
(require-init 'init-go-mode)
(require-init 'init-yaml-mode)
(require-init 'init-php-mode)
(require-init 'init-javascript)
(require-init 'init-web-mode)
(require-init 'init-coffee-mode)
(require-init 'init-scss-mode)
(require-init 'init-markdown-mode)
(require-init 'init-rust-mode)
(require-init 'init-toml-mode)
(require-init 'init-graphviz-dot-mode)

(require-init 'init-misc)
(require-init 'init-user-function)

;;----------------------------------------------------------------------------
;; Allow access from emacsclient
;;----------------------------------------------------------------------------
(require 'server)
(unless (server-running-p)
  (server-start))

;;----------------------------------------------------------------------------
;; Variables configured via the interactive 'customize' interface
;;----------------------------------------------------------------------------
(setq custom-file (expand-file-name "tmp/custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

;;----------------------------------------------------------------------------
;; Allow users to provide an optional "init-local" containing personal settings
;;----------------------------------------------------------------------------
(when (file-exists-p (expand-file-name "lisp/init-local.el" user-emacs-directory))
  (require-init 'init-local))

;;----------------------------------------------------------------------------
;; Locales (setting them earlier in this file doesn't work in X)
;;----------------------------------------------------------------------------
(require-init 'init-locales)

(provide 'init)
;;; init.el ends here
