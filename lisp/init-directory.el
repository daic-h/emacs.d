(require 'no-littering)

(require 'recentf)
(add-to-list 'recentf-exclude no-littering-var-directory)
(add-to-list 'recentf-exclude no-littering-etc-directory)

(setq auto-save-file-name-transforms
      `((".*" ,(no-littering-expand-var-file-name "auto-save/") t)))

(setq-default undohist-directory
              (expand-file-name "~/.undohist"))

;; trash
(when (not (functionp 'system-move-file-to-trash))
  ;; system-move-file-to-trashが環境で定義されていないときに使われる。
  (custom-set-variables '(trash-directory "~/.Trash"))
  (if (not (file-directory-p trash-directory)) (make-directory trash-directory)))

(provide 'init-directory)
