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
 line-spacing 0
 mouse-yank-at-point t
 set-mark-command-repeat-pop t
 truncate-lines nil
 truncate-partial-width-windows nil
 make-backup-files nil
 delete-auto-save-files t
 auto-save-default nil)

(blink-cursor-mode 0)
(transient-mark-mode 1)
(show-paren-mode 1)

(when *is-a-mac*
  (setq-default locate-command "mdfind"))

;; (electric-pair-mode t)

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

;; (define-key global-map (kbd "C-c r") 'query-replace)
;; (define-key global-map (kbd "C-c C-c r") 'query-replace-regexp)

;; 改行にインデントを追加
(define-key global-map (kbd "RET") 'newline-and-indent)
(electric-indent-mode -1)

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

(defadvice kill-region (around kill-line-or-kill-region activate)
  "リージョンを選択していないときに行をキルする"
  (if (and (called-interactively-p 'interactive)
           transient-mark-mode (not mark-active))
      (kill-whole-line)
    ad-do-it))

(defadvice kill-ring-save (around kill-line-save-or-kill-ring-save activate)
  "リージョンを選択していないときに行をコピーする"
  (if (and (called-interactively-p 'interactive)
           transient-mark-mode (not mark-active))
      (copy-line)
    ad-do-it))


;;----------------------------------------------------------------------------
;; Super Sort
;;----------------------------------------------------------------------------
(defun sort-regexp-lines (record-regexp begin end)
  (interactive "sRegexp specifying records to sort: \nr")
  (sort-regexp-fields nil
                      (format "^.*\\(%s.*\\).*$" record-regexp)
                      "\\1" begin end))

(provide 'init-editing-utils)
