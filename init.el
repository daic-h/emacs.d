;;; init.el --- Emacs configuration of Daichi Hirata -*- lexical-binding: t; -*-

;;; Commentary:
;; Flat configuration of Emacs

;;; Code:

(require 'package)
(setq package-user-dir (expand-file-name "~/.el-packages"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile (require 'use-package))
(require 'bind-key)

(use-package benchmark-init :ensure t
  :config
  ;; To disable collection of benchmark data after init is done.
  (add-hook 'after-init-hook 'benchmark-init/deactivate))

(use-package no-littering :ensure t
  :config
  (setq auto-save-file-name-transforms
      `((".*" ,(no-littering-expand-var-file-name "auto-save/") t))))

(use-package exec-path-from-shell :ensure t
  :if (memq window-system '(mac ns x))
  :init
  (exec-path-from-shell-initialize))

;;----------------------------------------------------------------------------
;; Load configs for specific features and modes
;;----------------------------------------------------------------------------

;; (use-package init-el-get
;;   :load-path "init")

(use-package init-fonts
  :load-path "init")

(use-package init-gui-frames
  :load-path "init")

(use-package init-osx-keys
  :load-path "init"
  :if (eq system-type 'darwin))

(use-package init-whitespace
  :load-path "init")

(use-package init-editing-utils
  :load-path "init")

(use-package init-hippie-expand
  :load-path "init")

(use-package init-windows
  :load-path "init")

(use-package init-misc
  :load-path "init")

(use-package init-user-function
  :load-path "init")

(use-package spacemacs-theme :ensure t
  :defer t
  :init
  (load-theme 'spacemacs-dark t))

(use-package spaceline-all-the-icons :ensure t
  :config
  (spaceline-all-the-icons-theme))

(use-package spaceline-config :ensure spaceline
  :config
  (spaceline-helm-mode))

(use-package recentf
  :config
  (setq-default recentf-save-file "~/.recentf")
  (setq recentf-max-saved-items 1000
        recentf-exclude '("/tmp/" "/ssh:"))
  (add-to-list 'recentf-exclude no-littering-var-directory)
  (add-to-list 'recentf-exclude no-littering-etc-directory)
  (recentf-mode +1))

(use-package uniquify
  :config
  (setq uniquify-buffer-name-style 'reverse)
  (setq uniquify-separator "/")
  (setq uniquify-after-kill-buffer-p t)
  (setq uniquify-ignore-buffers-re "^\\*"))

(use-package flycheck :ensure t
  :init
  (add-hook 'after-init-hook 'global-flycheck-mode)
  :config
  (setq flycheck-check-syntax-automatically '(save idle-change mode-enabled)
        flycheck-idle-change-delay 0.8
        flycheck-disabled-checkers '(emacs-lisp-checkdoc))
  :bind (("M-n" . flycheck-next-error)
         ("M-p" . flycheck-previous-error)))

(use-package popwin :ensure t
  :config
  (add-to-list 'display-buffer-alist 'popwin:display-buffer)
  ;; dired
  (push '(dired-mode :position top)
        popwin:special-display-config)
  ;; compile
  (push '("*Compile-Log*" :height 20 :noselect t)
        popwin:special-display-config)
  ;; backtrace
  (push '("*Backtrace*" :height 20 :noselect t)
        popwin:special-display-config)
  ;; helm
  (push '("^\*helm.+\*$" :regexp t :height 20)
        popwin:special-display-config)
  ;; twittering mode
  (push '(":home" :height 25)
        popwin:special-display-config)
  ;; auto-async-byte-compile
  (push '(" *auto-async-byte-compile*" :height 14 :noselect t :position bottom)
        popwin:special-display-config)
  ;; google-translate
  (push '("*Google Translate*" :height 14 :noselect t :position bottom)
        popwin:special-display-config)
  ;; quickrun
  (push '("*quickrun*" :height 25 :noselect t :position bottom)
        popwin:special-display-config)
  :bind (("C-x C-p" . popwin:keymap)))

(use-package helm :ensure t
  :bind (("C-M-'" . helm-imenu)
         ("M-x" . helm-M-x)
         ("C-x b" . helm-mini)
         ("C-x C-b" . helm-mini)
         ("M-r" . helm-resume)
         ("M-y" . helm-show-kill-ring)
         ("C-s" . helm-occur)
         :map helm-map
         ("C-h" . delete-backward-char)
         ("C-k" . kill-line))
  :config
  (require 'helm-config)
  (require 'helm-files)
  (remove-hook 'kill-emacs-hook 'helm-adaptive-save-history)
  (defadvice helm-buffers-sort-transformer (around ignore activate)
    (setq ad-return-value (ad-get-arg 0)))
  (setq helm-idle-delay 0.1
        helm-input-idle-delay 0
        helm-candidate-number-limit 500
        helm-ff-transformer-show-only-basename nil
        helm-buffer-max-length 50))

(use-package helm-descbinds :ensure t
  :defer t)

(use-package helm-swoop :ensure t
  :bind (("M-i" . helm-swoop)
         ("C-c M-i" . helm-multi-swoop)
         ("C-x M-i" . helm-multi-swoop-all)))

(use-package helm-ls-git :ensure t
  :bind (("C-'" . helm-ls-git-ls)))

(use-package helm-ag :ensure t
  :bind (("C-c C-'" . helm-ag)
         ("C-c C-t" . helm-ag-pop-stack)
         ("C-M-g" . helm-ag))
  :config
  (setq helm-ag-base-command "rg --vimgrep --no-heading"
        ;; helm-ag-insert-at-point 'symbol
        helm-ag-insert-at-point nil))

(use-package ido
  :config
  (setq ido-enable-flex-matching t
        ido-use-filename-at-point nil
        ido-auto-merge-work-directories-length -1
        ido-use-virtual-buffers t
        ido-default-buffer-method 'selected-window)
  (ido-mode +1))

(use-package ido-vertical-mode :ensure t
  :after ido
  :config
  (setq ido-vertical-define-keys 'C-n-and-C-p-only)
  (ido-vertical-mode +1))

(use-package auto-complete :ensure t
  :bind (("M-TAB" . auto-complete))
  :config
  (require 'auto-complete-config)
  (ac-config-default)
  (setq ac-auto-start 2)         ;; n文字以上の単語の時に補完を開始
  (setq ac-delay 0.05)           ;; n秒後に補完開始
  (setq ac-use-fuzzy t)          ;; 曖昧マッチ有効
  (setq ac-use-comphist t)       ;; 補完推測機能有効
  (setq ac-use-menu-map t)       ;; 保管メニューの移動
  (setq ac-auto-show-menu 0.05)  ;; n秒後に補完メニューを表示
  (setq ac-quick-help-delay 0.5) ;; n秒後にクイックヘルプを表示
  (setq ac-ignore-case nil)      ;; 大文字・小文字を区別する

  (defadvice ac-word-candidates (after remove-word-contain-japanese activate)
    (let ((contain-japanese (lambda (s) (string-match (rx (category japanese)) s))))
      (setq ad-return-value
            (remove-if contain-japanese ad-return-value))))

  ;; 補完メニューの選択色
  (set-face-background 'ac-selection-face "DarkSlateBlue"))

(use-package visual-regexp-steroids :ensure t
  :defer t
  :after visual-regexp)
(use-package visual-regexp :ensure t
  :defer t
  :bind (("C-c r" . 'vr/replace)
         ("C-c q" . 'vr/query-replace)
         ("C-c m" . 'vr/mc-mark)
         ("C-M-r" . 'vr/isearch-backward)
         ("C-M-s" . 'vr/isearch-forward))
  :config
  (setq vr/match-separator-string
      (progn
        (custom-reevaluate-setting 'query-replace-from-to-separator)
        (substring-no-properties query-replace-from-to-separator))))

(use-package howm :ensure t
  :bind (("C-c , ," . howm-menu))
  :config
  (setq howm-view-title-header "#"
        howm-directory (concat user-emacs-directory "howm/memo")
        howm-menu-lang 'ja
        howm-menu-top nil
        howm-file-name-format "%Y%m%d-%H%M%S.md"
        ;; 読み書き共通
        howm-process-coding-system 'utf-8-unix
        ;; メニューと履歴を検索対象から除外するために別ディレクトリへ
        howm-keyword-file (concat user-emacs-directory "howm/keys")
        howm-history-file (concat user-emacs-directory "howm/history")
        howm-menu-file    (concat user-emacs-directory "howm/menu")
        ;; 検索時に大文字と小文字を区別しない
        howm-keyword-case-fold-search t
        ;; 一覧にタイトル表示しない
        howm-list-title nil
        ;; save 時にメニューを更新しない
        howm-menu-refresh-after-save nil
        howm-refresh-after-save nil
        ;; RET でファイルを開く際, 一覧バッファを消す. C-u RET なら残る
        howm-view-summary-persistent nil
        ;; 新規メモを上に
        howm-prepend t
        ;; 全メモ一覧時にタイトル表示
        howm-list-all-title t
        ;;「最近のメモ」一覧時にタイトル表示
        howm-list-recent-title t
        ;; 「最近のメモ」の表示件数
        howm-menu-recent-num 15
        ;; メニューを 2 時間キャッシュ
        howm-menu-expiry-hours 2))

(use-package undohist :ensure t
  :config
  (setq-default undohist-directory
                (expand-file-name "~/.undohist"))
  (undohist-initialize))

(use-package redo+
  :load-path "site-lisp"
  :bind (("C-r" . 'redo)))

(use-package expand-region :ensure t
  :bind (("C-." . er/expand-region)
         ("C-," . er/contract-region)))

(use-package multiple-cursors :ensure t
  :bind (("C->" . mc/mark-next-like-this)
         ("C-M->" . mc/skip-to-next-like-this)
         ("C-<" . mc/unmark-next-like-this)
         ("C-c c c" . mc/edit-lines)
         ("C-c c e" . mc/edit-ends-of-lines)
         ("C-c c a" . mc/edit-beginnings-of-lines)))

(use-package auto-highlight-symbol :ensure t
  :config
  (global-auto-highlight-symbol-mode t))

(use-package sequential-command :ensure t
  :bind (("C-a" . seq-home)
         ("C-e" . seq-end))
  :config
  (define-sequential-command seq-home
    beginning-of-line beginning-of-buffer seq-return)
  (define-sequential-command seq-end
    end-of-line end-of-buffer seq-return))

(use-package cua-base
  :config
  (cua-mode t)
  (setq cua-enable-cua-keys nil))

(use-package diff-mode
  :config
  (set-face-attribute 'diff-added-face nil
                      :background nil :foreground "green"
                      :weight 'normal)
  (set-face-attribute 'diff-removed-face nil
                      :background nil :foreground "firebrick1"
                      :weight 'normal)
  (set-face-attribute 'diff-file-header-face nil
                      :background nil :weight 'extra-bold)
  (set-face-attribute 'diff-hunk-header-face nil
                      :foreground "chocolate4"
                      :background "white" :weight 'extra-bold
                      :underline t :inherit nil))

(use-package smartparens :ensure t
  :config
  (require 'smartparens-config)
  (smartparens-global-mode t))

(use-package eww
  :defer t
  :config
  (setq eww-search-prefix "http://www.google.co.jp/search?q=")
  (defun eww-search (term)
    (interactive "sSearch terms: ")
    (setq eww-hl-search-word term)
    (eww-browse-url (concat eww-search-prefix term)))
  (add-hook 'eww-after-render-hook (lambda ()
                                     (highlight-regexp eww-hl-search-word)
                                     (setq eww-hl-search-word nil)))
  ;; Images
  (defun eww-disable-images ()
    "eww で画像表示させない"
    (interactive)
    (setq-local shr-put-image-function 'shr-put-image-alt)
    (eww-reload))
  (defun eww-enable-images ()
    "eww で画像表示させる"
    (interactive)
    (setq-local shr-put-image-function 'shr-put-image)
    (eww-reload))
  (defun shr-put-image-alt (spec alt &optional flags)
    (insert alt))
  ;; はじめから非表示
  (defun eww-mode-hook--disable-image ()
    (setq-local shr-put-image-function 'shr-put-image-alt))
  (add-hook 'eww-mode-hook 'eww-mode-hook--disable-image)
  ;; Color
  (defvar eww-disable-colorize t)
  (defun shr-colorize-region--disable (orig start end fg &optional bg &rest _)
    (unless eww-disable-colorize
      (funcall orig start end fg)))
  (advice-add 'shr-colorize-region :around 'shr-colorize-region--disable)
  (advice-add 'eww-colorize-region :around 'shr-colorize-region--disable)
  (defun eww-disable-color ()
    "eww で文字色を反映させない"
    (interactive)
    (setq-local eww-disable-colorize t)
    (eww-reload))
  (defun eww-enable-color ()
    "eww で文字色を反映させる"
    (interactive)
    (setq-local eww-disable-colorize nil)
    (eww-reload)))

(use-package neotree :ensure t
  :bind (("C-x C-j" . neotree-toggle))
  :config
  (setq neo-theme (if (display-graphic-p) 'icons 'arrow)))

(use-package volatile-highlights :ensure t
  :config
  (volatile-highlights-mode t))

(use-package rotate :ensure t
  :bind
  ("C-c C-SPC" . rotate-layout)
  ("C-c C-c C-SPC" . rotate-window))

(use-package git-commit-mode
  :defer t
  :load-path "site-lisp")

(use-package json-reformat :ensure t
  :defer t)

;;----------------------------------------------------------------------------
;; Programs
;;----------------------------------------------------------------------------

(use-package cc-mode
  :defer t
  :config
  (defun my-c-mode-common-hook ()
    (setq c-basic-offset 4)
    (setq tab-width 4))
  (add-hook 'c-mode-common-hook #'my-c-mode-common-hook))

(use-package sh-script
  :mode (("\\.alias\\'"       . shell-script-mode)
         ("\\.gpms\\'"        . shell-script-mode)
         ("\\.cfg\\'"         . shell-script-mode)
         ("\\.c*sh\\'"        . shell-script-mode)
         ("\\.[a-zA-Z]+rc\\'" . shell-script-mode)
         ("\\.zsh\\'"         . shell-script-mode)
         ("\\.zshenv\\'"      . shell-script-mode)
         ("\\.sh\\'"          . shell-script-mode)
         ("crontab.*\\'"      . shell-script-mode))
  :config
  (defvar auto-sh-set-shell-alist
    '(("\\(?:[.]?bashrc\\|[.]bash_profile\\)\\>" . "bash")
      ("\\(?:\\(?:csh\\)?[.]\\(?:cshrc\\|log\\(?:in\\|out\\)\\)\\|[.]tcshrc\\)\\>" . "csh")
      ("\\(?:[.]zsh\\|[.]?z\\(?:profile\\|log\\(?:in\\|out\\)\\|sh\\(?:env\\|rc\\)\\)\\)\\>" . "zsh")))
  (defun sh-set-shell-advice (forig &rest args)
    (let ((shell (pop args)))
      (when (and (not (called-interactively-p 'any))
                 (or (string= "sh" shell) (string= sh-shell-file shell)))
        (setq shell (or (assoc-default buffer-file-name auto-sh-set-shell-alist #'string-match) "sh")))
      (apply forig (cons shell args))))
  (advice-add 'sh-set-shell :around #'sh-set-shell-advice))

(use-package rufo :ensure t
  :after ruby-mode)
(use-package rbenv :ensure t
  :after ruby-mode
  :config
  (setq rbenv-show-active-ruby-in-modeline nil)
  (global-rbenv-mode))
(use-package ruby-mode
  :defer t
  :config
  (defun ruby--encoding-comment-required-p () nil)
  (defun my-ruby-mode-hook ()
    (setq rufo-minor-mode-use-bundler t
          ruby-indent-level 2
          ruby-indent-tabs-mode nil))
  (add-hook 'ruby-mode-hook #'my-ruby-mode-hook))

(use-package go-eldoc :ensure t :after go-mode)
(use-package go-mode :ensure t
  :defer t
  :config
  (defun my-gomode-hook ()
    (setq c-basic-offset 4)
    (setq indent-tabs-mode t)
    (go-eldoc-setup)
    (add-hook 'before-save-hook 'gofmt-before-save)
    (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)
    (local-set-key (kbd "C-c i") 'go-goto-imports)
    (local-set-key (kbd "C-c d") 'godoc)
    (local-set-key (kbd "C-c C-b") 'pop-tag-mark))
  (add-hook 'go-mode-hook #'my-gomode-hook))

(use-package toml-mode :ensure t
  :defer t)

(use-package yaml-mode :ensure t
  :defer t)

(use-package php-mode :ensure t
  :defer t
  :bind (:map php-mode-map
         ("C-." . 'er/expand-region)
         ("C-," . 'er/contract-region))
  :config
  (defun my-php-mode-hook ()
    (setq indent-tabs-mode nil)
    (setq c-basic-offset 4)
    (setq tab-width 4)
    (c-set-offset 'case-label' 4)
    (c-set-offset 'substatement-open 0))
  (add-hook 'php-mode-hook #'my-php-mode-hook))

(use-package vue-mode :ensure t
  :defer t)
(use-package prettier-js :ensure t
  :defer t
  :after (:any vue-mode js2-mode)
  :init
  (add-hook 'js2-mode-hook 'prettier-js-mode)
  (add-hook 'vue-mode-hook 'prettier-js-mode))
(use-package add-node-modules-path :ensure t
  :defer t
  :init
  (add-hook 'js2-mode-hook #'add-node-modules-path)
  (add-hook 'vue-mode-hook #'add-node-modules-path))
(use-package js2-mode :ensure t
  :defer t
  :config
  (setq js-indent-level 2
        js2-basic-offset 2
        js2-strict-trailing-comma-warning nil
        js2-strict-inconsistent-return-warning nil
        js2-strict-missing-semi-warning nil))

(use-package web-mode :ensure t
  :mode (("\\.html?$" . web-mode)
         ("\\.phtml$" . web-mode)
         ("\\.erb$" . web-mode))
  :config
  (defun my-web-mode-hook ()
    (setq web-mode-indent-style 2
          web-mode-attr-indent-offset 2
          web-mode-markup-indent-offset 2
          web-mode-css-indent-offset 2
          web-mode-code-indent-offset 2))
  (add-hook 'web-mode-hook #'my-web-mode-hook))

(use-package coffee-mode :ensure t
  :defer t
  :custom
  (coffee-tab-width 2 ""))

(use-package css-mode :ensure t
  :mode ("\\.scss$" . css-mode))

(use-package markdown-mode :ensure t
  :mode ("\\.md\\'" . gfm-mode)
  :config
  (defun my-markdown-mode-hook ()
    (setq markdown-command "multimarkdown")
    ;; a.
    (custom-set-faces
     '(markdown-header-face-1 ((t (:inherit howm-mode-title-face markdown-header-face))))
     '(markdown-header-face-2 ((t (:inherit outline-2 markdown-header-face))))
     '(markdown-header-face-3 ((t (:inherit outline-3 markdown-header-face))))
     '(markdown-header-face-4 ((t (:inherit outline-4 markdown-header-face))))
     '(markdown-header-face-5 ((t (:inherit outline-5 markdown-header-face))))
     '(markdown-header-face-6 ((t (:inherit outline-6 markdown-header-face)))))
    ;; b.
    (add-to-list 'markdown-mode-font-lock-keywords-basic
                 (cons markdown-regex-header-1-atx '((1 markdown-header-face-1)
                                                     (2 markdown-header-face-1)
                                                     (3 markdown-header-face-1))))
    (add-to-list 'markdown-mode-font-lock-keywords-basic
                 (cons markdown-regex-header-2-atx '((1 markdown-header-face-2)
                                                     (2 markdown-header-face-2)
                                                     (3 markdown-header-face-2))))
    (add-to-list 'markdown-mode-font-lock-keywords-basic
                 (cons markdown-regex-header-3-atx '((1 markdown-header-face-3)
                                                     (2 markdown-header-face-3)
                                                     (3 markdown-header-face-3))))
    (add-to-list 'markdown-mode-font-lock-keywords-basic
                 (cons markdown-regex-header-4-atx '((1 markdown-header-face-4)
                                                     (2 markdown-header-face-4)
                                                     (3 markdown-header-face-4))))
    (add-to-list 'markdown-mode-font-lock-keywords-basic
                 (cons markdown-regex-header-5-atx '((1 markdown-header-face-5)
                                                     (2 markdown-header-face-5)
                                                     (3 markdown-header-face-5))))
    (add-to-list 'markdown-mode-font-lock-keywords-basic
                 (cons markdown-regex-header-6-atx '((1 markdown-header-face-6)
                                                     (2 markdown-header-face-6)
                                                     (3 markdown-header-face-6)))))
  (add-hook 'markdown-mode-hook #'my-markdown-mode-hook))

(use-package rust-mode :ensure t
  :defer t)

(use-package dockerfile-mode :ensure t
  :defer t)

(use-package haml-mode :ensure t
  :defer t)

(use-package jinja2-mode :ensure t
  :defer t)

(use-package lua-mode :ensure t
  :defer t)

(use-package protobuf-mode :ensure t
  :defer t)

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
(use-package init-locales
  :load-path "init")

(provide 'init)
;;; init.el ends here
