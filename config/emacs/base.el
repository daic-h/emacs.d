;;
;; Language
;;________________________________________________________________
(set-language-environment 'Japanese)
(prefer-coding-system 'utf-8)

;;
;; Backup File
;;________________________________________________________________
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq delete-auto-save-files t)
(setq undo-outer-limit nil)

;;
;; Base setting
;;_______________________________________________________________
(setq recentf-max-saved-items 500)                       ;; 最近のファイル500個を保存する
(setq recentf-max-menu-items 30)                         ;; 最近のファイル30個を表示する
(setq read-file-name-completion-ignore-case t)           ;; 補完で大文字小文字無視
(auto-compression-mode t)                                ;; 日本語infoの文字化け防止
(setq inhibit-startup-message t)                         ;; 起動時のメッセージは消す
(setq-default tab-width 4 indent-tabs-mode nil)          ;; tabは4文字分、改行後に自動インデント
(setq ring-bell-function 'ignore)                        ;; 警告音を消す
(setq kill-whole-line t)                                 ;; 行の先頭でC-kを一回押すだけで行全体を消去する
(add-hook 'before-save-hook 'delete-trailing-whitespace) ;; 末尾の空白をbefore-save-hookで削除
(fset 'yes-or-no-p 'y-or-n-p)                            ;; Emacsからの質問を y/n で回答する
(setq process-kill-without-query t)                      ;; 終了時に自動でプロセスをkill
(setq x-select-enable-clipboard t)                       ;; クリップボードにコピー
(cua-mode t)
(setq cua-enable-cua-keys nil)                           ;; 変なキーバインド禁止
(setq gc-cons-threshold (* 10 gc-cons-threshold))        ;; GCを減らして軽くする
(setq echo-keystrokes 0.1)                               ;; キーストロークのミニバッファへの表示を早く
(setq use-dialog-box nil)                                ;; ダイアログを使わない
(defalias 'message-box 'message)                         ;;
(put 'dired-find-alternate-file 'disabled nil)           ;; Dired
(setq max-lisp-eval-depth 5000)
(setq max-specpdl-size 5000)

;; Change Directory
;;_______________________________________________________________
(setq backup-directory-alist (list (cons ""  (concat user-emacs-directory "tmp/backup"))))
(setq auto-save-list-file-prefix (concat user-emacs-directory "tmp/saves/"))
(setq abbrev-file-name (concat user-emacs-directory "tmp/abbrev_defs"))

;; Server Start for Emacs-client
;;_______________________________________________________________
(require 'server)
(unless (server-running-p)
  (server-start))

;;
;; Emacs-version Predicates
;;________________________________________________________________
(dolist (ver '("22" "23" "24"))
  (set (intern (concat "emacs" ver "-p"))
       (if (string-match (concat "^" ver) emacs-version) t nil)))

;;
;; System-type predicates
;;________________________________________________________________
(defun x->bool (elt) (not (not elt)))
(setq darwin-p  (eq system-type 'darwin)
      ns-p      (eq window-system 'ns)
      carbon-p  (eq window-system 'mac)
      linux-p   (eq system-type 'gnu/linux)
      colinux-p (when linux-p
                  (let ((file "/proc/modules"))
                    (and (file-readable-p file)
                         (x->bool
                          (with-temp-buffer
                            (insert-file-contents file)
                            (goto-char (point-min))
                            (re-search-forward "^cofuse\.+" nil t))))))
      cygwin-p  (eq system-type 'cygwin)
      nt-p      (eq system-type 'windows-nt)
      meadow-p  (featurep 'meadow)
      windows-p (or cygwin-p nt-p meadow-p))

;; Meta key
;;________________________________________________________________
(when ns-p
  (setq ns-command-modifier 'meta)
  (setq ns-alternate-modifier 'super)
  (setq ns-right-command-modifier 'hyper)
  ;; (setq ns-right-alternate-modifier 'alt)
  (setq mac-pass-command-to-system nil))

;; My Info
;;________________________________________________________________
(setq user-mail-address (concat "bunny.hop.md" "@" "gmail.com"))
