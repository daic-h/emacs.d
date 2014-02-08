(require 'auto-complete-config)
(setq ac-comphist-file (concat user-emacs-directory
                               "tmp/cache/ac-comphist.dat." (system-name)))

(ac-config-default)

(setq ac-auto-start 2)         ;; n文字以上の単語の時に補完を開始
(setq ac-delay 0.05)           ;; n秒後に補完開始
(setq ac-use-fuzzy t)          ;; 曖昧マッチ有効
(setq ac-use-comphist t)       ;; 補完推測機能有効
(setq ac-use-menu-map t)       ;; 保管メニューの移動
(setq ac-auto-show-menu 0.05)  ;; n秒後に補完メニューを表示
(setq ac-quick-help-delay 0.5) ;; n秒後にクイックヘルプを表示
(setq ac-ignore-case nil)      ;; 大文字・小文字を区別する

(define-key ac-mode-map (kbd "M-TAB") 'auto-complete)  ; M-TABで補完開始

;; 情報源として
;; * ac-source-filename
;; * ac-source-words-in-same-mode-buffers
;; を利用
;;(setq-default ac-sources '(ac-source-filename ac-source-words-in-same-mode-buffers))

(defadvice ac-word-candidates (after remove-word-contain-japanese activate)
  (let ((contain-japanese (lambda (s) (string-match (rx (category japanese)) s))))
    (setq ad-return-value
          (remove-if contain-japanese ad-return-value))))

;; 補完メニューの選択色
(set-face-background 'ac-selection-face "DarkSlateBlue")

;; (require 'auto-complete-config)
;; (global-auto-complete-mode t)
;; (setq-default ac-expand-on-auto-complete nil)
;; (setq-default ac-auto-start nil)
;; (setq-default ac-dwim nil) ; To get pop-ups with docs even if a word is uniquely completed

;; ;;----------------------------------------------------------------------------
;; ;; Use Emacs' built-in TAB completion hooks to trigger AC (Emacs >= 23.2)
;; ;;----------------------------------------------------------------------------
;; (setq tab-always-indent 'complete)  ;; use 't when auto-complete is disabled
;; (add-to-list 'completion-styles 'initials t)

;; ;; TODO: find solution for php, haskell and other modes where TAB always does something

;; (setq c-tab-always-indent nil
;;       c-insert-tab-function 'indent-for-tab-command)

;; ;; hook AC into completion-at-point
;; (defun sanityinc/auto-complete-at-point ()
;;   (when (and (not (minibufferp))
;;              (fboundp 'auto-complete-mode)
;;              auto-complete-mode)
;;     (auto-complete)))

;; (defun sanityinc/never-indent ()
;;   (set (make-local-variable 'indent-line-function) (lambda () 'noindent)))

;; (defun set-auto-complete-as-completion-at-point-function ()
;;   (setq completion-at-point-functions
;;         (cons 'sanityinc/auto-complete-at-point
;;               (remove 'sanityinc/auto-complete-at-point completion-at-point-functions))))

;; (add-hook 'auto-complete-mode-hook 'set-auto-complete-as-completion-at-point-function)


;; (set-default 'ac-sources
;;              '(ac-source-imenu
;;                ac-source-dictionary
;;                ac-source-words-in-buffer
;;                ac-source-words-in-same-mode-buffers
;;                ac-source-words-in-all-buffer))

;; (dolist (mode '(magit-log-edit-mode
;;                 log-edit-mode org-mode text-mode haml-mode
;;                 git-commit-mode
;;                 sass-mode yaml-mode csv-mode espresso-mode haskell-mode
;;                 html-mode nxml-mode sh-mode smarty-mode clojure-mode
;;                 lisp-mode textile-mode markdown-mode tuareg-mode
;;                 js3-mode css-mode less-css-mode sql-mode
;;                 sql-interactive-mode
;;                 inferior-emacs-lisp-mode))
;;   (add-to-list 'ac-modes mode))


;; ;; Exclude very large buffers from dabbrev
;; (defun sanityinc/dabbrev-friend-buffer (other-buffer)
;;   (< (buffer-size other-buffer) (* 1 1024 1024)))

;; (setq dabbrev-friend-buffer-function 'sanityinc/dabbrev-friend-buffer)


(provide 'init-auto-complete)
