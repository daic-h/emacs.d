;; (require 'dired+)

;; (setq diredp-hide-details-initially-flag nil)

;; (when (fboundp 'global-dired-hide-details-mode)
;;   (global-dired-hide-details-mode -1))

;; (setq dired-recursive-deletes 'top)

;; (setq dired-dwim-target t)

;; ;; ファイルなら別バッファで、ディレクトリなら同じバッファで開く
;; (defun dired-open-in-accordance-with-situation ()
;;   (interactive)
;;   (let ((file (dired-get-filename)))
;;     (if (file-directory-p file)
;;         (dired-find-alternate-file)
;;       (dired-find-file))))

;; (put 'dired-find-alternate-file 'disabled nil)
;; RET 標準の dired-find-file では dired バッファが複数作られるので
;; dired-find-alternate-file を代わりに使う
;; (define-key dired-mode-map (kbd "RET") 'dired-open-in-accordance-with-situation)
;; (define-key dired-mode-map (kbd "a") 'dired-find-file)

(provide 'init-dired)
