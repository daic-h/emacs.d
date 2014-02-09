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
;; Locales (setting them earlier in this file doesn't work in X)
;;----------------------------------------------------------------------------
(require 'init-locales)

(add-hook 'after-init-hook
          (lambda ()
            (message "init completed in %.2fms"
                     (sanityinc/time-subtract-millis after-init-time before-init-time))))

(provide 'init)
;;; init.el ends here
