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
;; (require 'init-compat)
(require 'init-utils)
(require 'init-site-lisp)
(require 'init-el-bundler)
(require 'init-exec-path)

;;----------------------------------------------------------------------------
;; Load configs for specific features and modes
;;----------------------------------------------------------------------------
(require 'init-themes)
(require 'init-modeline)
(require 'init-osx-keys)
(require 'init-gui-frames)
(require 'init-dired)
(require 'init-uniquify)
(require 'init-flycheck)
;; (require 'init-isearch)

(require 'init-helm)
(require 'init-recentf)
(require 'init-ido)
(require 'init-hippie-expand)
(require 'init-auto-complete)
(require 'init-sessions)
(require 'init-fonts)
;; (require 'init-windows)

(require 'init-git)
(require 'init-git-gutter)

(require 'init-redo)
(require 'init-undohist)
(require 'init-expand-region)
(require 'init-multiple-cursors)
(require 'init-auto-highlight-symbol)
(require 'init-sequential-command)
(require 'init-cua-mode)
(require 'init-diff-mode)
(require 'init-smooth-scroll)
(require 'init-ace-jump-mode)
(require 'init-flex-autopair)
(require 'init-point-undo)
(require 'init-goto-chg)
(require 'init-editing-utils)

(require 'init-popwin)
(require 'init-google-translate)
(require 'init-jaunte)
(require 'init-rotate)
;; elscreen.el
;; emacs-w3m.el
;; growthforecast.el
;; grep-edit.el
;; guide-key.el
;; quickrun.el
;; multi-term.el

(require 'init-cc-mode)
(require 'init-shell-script-mode)
(require 'init-ruby-mode)
(require 'init-yaml-mode)
(require 'init-php-mode)
(require 'init-js2-mode)
(require 'init-web-mode)
(require 'init-coffee-mode)
;; erlang-mode.el
;; go-mode.el
;; haml-mode.el
;; scala-mode2.el
;; scheme-mode.el
;; scss-mode.el

(require 'init-navi2ch)
(require 'init-twittering-mode)

(require 'init-misc)
(require 'init-user-function)

;;----------------------------------------------------------------------------
;; Allow access from emacsclient
;;----------------------------------------------------------------------------
(require 'server)
(unless (server-running-p)
  (server-start))

;;----------------------------------------------------------------------------
;; Variables configured via the interactive 'customize' interface
;;----------------------------------------------------------------------------
(setq custom-file (expand-file-name "custom.el" (concat user-emacs-directory "tmp/")))
(when (file-exists-p custom-file)
  (load custom-file))

;;----------------------------------------------------------------------------
;; Allow users to provide an optional "init-local" containing personal settings
;;----------------------------------------------------------------------------
(when (file-exists-p (expand-file-name "init-local.el" user-emacs-directory))
  (error "Please move init-local.el to ~/.emacs.d/lisp"))
(require 'init-local nil t)

;;----------------------------------------------------------------------------
;; Custom Keymap
;;----------------------------------------------------------------------------
(require 'init-keymap)

;;----------------------------------------------------------------------------
;; Locales (setting them earlier in this file doesn't work in X)
;;----------------------------------------------------------------------------
(require 'init-locales)

;;----------------------------------------------------------------------------
;; My Info
;;----------------------------------------------------------------------------
(setq user-mail-address (concat "bunny.hop.md" "@" "gmail.com"))

(add-hook 'after-init-hook
          (lambda ()
            (message "init completed in %.2fms"
                     (sanityinc/time-subtract-millis after-init-time before-init-time))))



;; (require-package 'wgrep)
;; (require-package 'project-local-variables)
;; (require-package 'diminish)
;; (require-package 'scratch)
;; (require-package 'mwe-log-commands)

;; (require 'init-frame-hooks)
;; (require 'init-xterm)
;; (require 'init-themes)
;; (require 'init-osx-keys)
;; (require 'init-gui-frames)
;; (require 'init-maxframe)
;; (require 'init-proxies)
;; (require 'init-dired)
;; (require 'init-isearch)
;; (require 'init-uniquify)
;; (require 'init-ibuffer)
;; (require 'init-flycheck)

;; (require 'init-recentf)
;; (require 'init-ido)
;; (require 'init-hippie-expand)
;; (require 'init-auto-complete)
;; (require 'init-windows)
;; (require 'init-sessions)
;; (require 'init-fonts)
;; (require 'init-mmm)

;; (require 'init-editing-utils)

;; (require 'init-darcs)
;; (require 'init-git)

;; (require 'init-crontab)
;; (require 'init-textile)
;; (require 'init-markdown)
;; (require 'init-csv)
;; (require 'init-erlang)
;; (require 'init-javascript)
;; (require 'init-php)
;; (require 'init-org)
;; (require 'init-nxml)
;; (require 'init-css)
;; (require 'init-haml)
;; (require 'init-python-mode)
;; (require 'init-haskell)
;; (require 'init-ruby-mode)
;; (require 'init-rails)
;; (require 'init-sql)

;; (require 'init-paredit)
;; (require 'init-lisp)
;; (require 'init-slime)
;; (require 'init-clojure)
;; (require 'init-common-lisp)

;; (when *spell-check-support-enabled*
;;   (require 'init-spelling))

;; (require 'init-marmalade)
;; (require 'init-misc)

;; (require 'init-dash)
;; (require 'init-ledger)
;; ;; Extra packages which don't require any configuration

;; (require-package 'gnuplot)
;; (require-package 'lua-mode)
;; (require-package 'htmlize)
;; (require-package 'dsvn)
;; (when *is-a-mac*
;;   (require-package 'osx-location))
;; (require-package 'regex-tool)

(provide 'init)
;;; init.el ends here
