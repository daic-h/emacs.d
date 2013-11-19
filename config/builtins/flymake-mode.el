(eval-when-compile (require 'cl))

;; setting for flymake
(require 'flymake)

;; GUIでの警告を表示しない
(setq flymake-gui-warnings-enabled nil)

;; avoid abnormal exit
(defadvice flymake-post-syntax-check
  (before flymake-force-check-was-interrupted)
  (setq flymake-check-was-interrupted t))
(ad-activate 'flymake-post-syntax-check)
(global-set-key (kbd "M-n") 'flymake-goto-next-error)
(global-set-key (kbd "M-p") 'flymake-goto-prev-error)

(when (executable-find "growlnotify")
  (defun flymake-growlnotify ()
    (let ((count (length flymake-err-info)))
      (when (> count 0)
        (dolist (err-info flymake-err-info)
          (let* ((line  (car err-info))
                 (text  (flymake-ler-text (caadr err-info)))
                 (title (concat (buffer-name (current-buffer)) ":" (int-to-string line))))
            (start-process-shell-command
             "emacs-flymake" nil
             (format "growlnotify -a Emacs -n 'Emacs - Flymake' -p 2 -t %s -m %s" title (shell-quote-argument text))))))))
  (add-hook 'after-save-hook 'flymake-growlnotify))

;; flymake を使えない場合をチェック
(defadvice flymake-can-syntax-check-file
  (after my-flymake-can-syntax-check-file activate)
  (cond
   ((not ad-return-value))
   ;; tramp 経由であれば、無効
   ((and (fboundp 'tramp-list-remote-buffers)
         (memq (current-buffer) (tramp-list-remote-buffers)))
    (setq ad-return-value nil))
   ;; 書き込み不可ならば、flymakeは無効
   ((not (file-writable-p buffer-file-name))
    (setq ad-return-value nil))
   ;; flymake で使われるコマンドが無ければ無効
   ((let ((cmd (nth 0 (prog1
                          (funcall (flymake-get-init-function buffer-file-name))
                        (funcall (flymake-get-cleanup-function buffer-file-name))))))
      (and cmd (not (executable-find cmd))))
    (setq ad-return-value nil))))
