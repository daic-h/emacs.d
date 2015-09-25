;;
;; descbinds
;;
(require 'helm-descbinds)
(helm-descbinds-mode 1)

;;
;; helm-gtags
;;
(lazyload (helm-gtags-mode) "helm-gtags"
  ;; customize
  (setq helm-gtags-path-style 'relative)
  (setq helm-gtags-ignore-case t)
  (setq helm-gtags-read-only nil)
  ;; key bindings
  (local-set-key (kbd "M-t") 'helm-gtags-find-tag)
  (local-set-key (kbd "M-r") 'helm-gtags-find-rtag)
  (local-set-key (kbd "M-s") 'helm-gtags-find-symbol)
  (local-set-key (kbd "C-t") 'helm-gtags-pop-stack))

;;
;; helm-swoop
;;
(lazyload (helm-swoop helm-multi-swoop helm-multi-swoop-all) "helm-swoop")
(global-set-key (kbd "M-i") 'helm-swoop)
(global-set-key (kbd "C-c M-i") 'helm-multi-swoop)
(global-set-key (kbd "C-x M-i") 'helm-multi-swoop-all)

;;
;; helm-ls-git
;;
(lazyload (helm-ls-git-ls) "helm-ls-git")
(global-set-key (kbd "C-'") 'helm-ls-git-ls)

;;
;; helm-growthforecast
;;
(lazyload (helm-growthforecast) "helm-growthforecast")

;;
;; helm-ag
;;
(lazyload (helm-ag) "helm-ag"
  (setq helm-ag-source-type 'one-line))
(global-set-key (kbd "C-c C-'") 'helm-ag)
(global-set-key (kbd "C-c C-t") 'helm-ag-pop-stack)

;;
;; helm-ghq
;:
(defun helm-ghq--open-dired (file)
  (dired (file-name-directory file)))

(defmacro helm-ghq--line-string ()
  `(buffer-substring-no-properties
    (line-beginning-position) (line-end-position)))

(defun helm-ghq--root ()
  (with-temp-buffer
    (unless (zerop (call-process "git" nil t nil "config" "ghq.root"))
      (error "Failed: Can't find ghq.root"))
    (goto-char (point-min))
    (expand-file-name (helm-ghq--line-string))))

(defun helm-ghq--list-candidates ()
  (with-temp-buffer
    (unless (zerop (call-process "ghq" nil t nil "list" "--full-path"))
      (error "Failed: ghq list --full-path'"))
    (let ((ghq-root (helm-ghq--root))
          paths)
      (goto-char (point-min))
      (while (not (eobp))
        (let ((path (helm-ghq--line-string)))
          (push (cons (file-relative-name path ghq-root) path) paths))
        (forward-line 1))
      (reverse paths))))

(defun helm-ghq--list-ls-files ()
  (with-current-buffer (helm-candidate-buffer 'global)
    (unless (zerop (call-process "git" nil t nil "ls-files"))
      (error "Failed: 'git ls-files'"))))

(defun helm-ghq--source (repo)
  (let ((name (file-name-nondirectory (directory-file-name repo))))
    `((name . ,name)
      (init . helm-ghq--list-ls-files)
      (candidates-in-buffer)
      (action . (("Open File" . find-file)
                 ("Open File other window" . find-file-other-window)
                 ("Open Directory" . helm-ghq--open-dired))))))

;;;###autoload
(defun helm-ghq-list ()
  (interactive)
  (let ((repo (helm-comp-read "ghq-list: "
                              (helm-ghq--list-candidates)
                              :name "ghq list"
                              :must-match t)))
    (let ((default-directory (file-name-as-directory repo)))
      (helm :sources (helm-ghq--source default-directory)
            :buffer "*helm-ghq-list*"))))

(provide 'init-helm-ext)

;; (helm :sources '(;;helm-source-ls-git-status
;;                  ;; helm-source-ls-git-buffers
;;                  helm-source-ls-git
;;                  )
;;         ;; When `helm-ls-git-ls' is called from lisp
;;         ;; `default-directory' is normally let-bounded,
;;         ;; to some other value;
;;         ;; we now set this new let-bounded value local
;;         ;; to `helm-default-directory'.
;;         :default-directory default-directory
;;         :buffer "*helm lsgit*")
