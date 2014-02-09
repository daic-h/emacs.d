;;----------------------------------------------------------------------------
;; Some basic preferences
;;----------------------------------------------------------------------------
(setq-default
 visible-bell nil
 ring-bell-function 'ignore
 undo-outer-limit nil
 tab-width 4
 kill-whole-line t
 case-fold-search t
 indent-tabs-mode nil
 column-number-mode t
 buffers-menu-max-size 30
 echo-keystrokes 0.1
 compilation-scroll-output t
 delete-selection-mode t
 grep-highlight-matches t
 grep-scroll-output t
 ;; line-spacing 0.2
 mouse-yank-at-point t
 set-mark-command-repeat-pop t
 show-trailing-whitespace t
 truncate-lines nil
 truncate-partial-width-windows nil

 make-backup-files nil
 backup-directory-alist (list (cons ""  (concat user-emacs-directory "tmp/backup")))
 bookmark-default-file (concat user-emacs-directory "tmp/.bookmarks." (system-name) ".el")

 delete-auto-save-files t
 auto-save-default nil
 auto-save-file-name-transforms `((".*" ,(expand-file-name "~/.emacs.d/tmp/backup/") t))
 auto-save-list-file-prefix (concat user-emacs-directory "tmp/saves/")

 abbrev-file-name (concat user-emacs-directory "tmp/abbrev_defs"))

(blink-cursor-mode 0)
(transient-mark-mode 1)
(show-paren-mode 1)

;; 末尾の空白をbefore-save-hookで削除
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(when *is-a-mac*
  (setq-default locate-command "mdfind"))

;; But don't show trailing whitespace in SQLi, inf-ruby etc.
(dolist (hook '(special-mode-hook
                eww-mode
                term-mode-hook
                comint-mode-hook
                compilation-mode-hook
                twittering-mode-hook
                minibuffer-setup-hook))
  (add-hook hook (lambda () (setq show-trailing-whitespace nil))))

(custom-set-faces
 '(trailing-whitespace ((t (:foreground "SteelBlue" :underline t)))))

;;----------------------------------------------------------------------------
;; Don't disable narrowing commands
;;----------------------------------------------------------------------------
(put 'narrow-to-region 'disabled nil)
(put 'narrow-to-page 'disabled nil)
(put 'narrow-to-defun 'disabled nil)

;;----------------------------------------------------------------------------
;; Don't disable case-change functions
;;----------------------------------------------------------------------------
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

;;----------------------------------------------------------------------------
;; Handy key bindings
;;----------------------------------------------------------------------------
(define-key global-map (kbd "M-g") 'goto-line)
(define-key global-map (kbd "C-c a") 'align-regexp)
(define-key global-map (kbd "M-?") 'help-for-help)
(define-key global-map (kbd "C-h") 'delete-backward-char)
(define-key global-map (kbd "C-S-i") 'indent-region)
(define-key global-map (kbd "C-c TAB") #'toggle-truncate-lines)

(define-key global-map (kbd "C-c r") 'query-replace)
(define-key global-map (kbd "C-c C-c r") 'query-replace-regexp)

;; 改行にインデントを追加
(define-key global-map (kbd "RET") 'newline-and-indent)

;; ¥の代わりにバックスラッシュを入力する
(define-key global-map [?¥] [?\\])

;; vimライク行連結
(define-key global-map (kbd "C-j") 'join-line)

(defun kill-back-to-indentation ()
  "Kill from point back to the first non-whitespace character on the line."
  (interactive)
  (let ((prev-pos (point)))
    (back-to-indentation)
    (kill-region (point) prev-pos)))

(define-key global-map (kbd "C-M-<backspace>") 'kill-back-to-indentation)

(defun copy-and-comment-out (start end)
  "コメントアウトをしながら貼り付け"
  (interactive "r")
  (kill-ring-save start end)
  (comment-region start end)
  (newline 2)
  (yank))

(define-key global-map (kbd "C-M-:") #'copy-and-comment-out)

;;----------------------------------------------------------------------------
;; リージョンを選択していない時のkill-regionとkill-ring-save
;;----------------------------------------------------------------------------
(defun copy-line (&optional arg)
  (interactive "p")
  (copy-region-as-kill
   (line-beginning-position)
   (line-beginning-position (1+ (or arg 1))))
  (message "Line copied"))

;; リージョンを選択していないときに行をキルする
(defadvice kill-region (around kill-line-or-kill-region activate)
  (if (and (called-interactively-p 'interactive)
           transient-mark-mode (not mark-active))
      (kill-whole-line)
    ad-do-it))

;; リージョンを選択していないときに行をコピーする
(defadvice kill-ring-save (around kill-line-save-or-kill-ring-save activate)
  (if (and (called-interactively-p 'interactive)
           transient-mark-mode (not mark-active))
      (copy-line)
    ad-do-it))

;;----------------------------------------------------------------------------
;; 全角スペース、タブの強調表示
;;----------------------------------------------------------------------------
(defface my-face-b-1 '((t (:background "medium aquamarine"))) nil :group 'my-face)
(defface my-face-b-2 '((t (:background "medium aquamarine"))) nil :group 'my-face)
(defvar  my-face-b-1 'my-face-b-1)
(defvar  my-face-b-2 'my-face-b-2)
(make-variable-buffer-local 'my-face-b-1)
(make-variable-buffer-local 'my-face-b-2)

(defadvice font-lock-mode (before my-font-lock-mode ())
  (font-lock-add-keywords major-mode '(("　" 0 my-face-b-1 append)
                                       ("\t" 0 my-face-b-2 append))))

(defun font-lock-mode-fn ()
  (if font-lock-mode nil (font-lock-mode t)))

(ad-activate 'font-lock-mode)
(ad-enable-advice 'font-lock-mode 'before 'my-font-lock-mode)
(add-hook 'find-file-hooks 'font-lock-mode-fn t)

(provide 'init-editing-utils)
