(defvar my-emacs-dir (expand-file-name user-emacs-directory))
(defvar my-tmp-dir (concat my-emacs-dir "tmp/"))
(defvar my-history-dir (concat my-tmp-dir "hist/"))
(defvar my-backup-dir (concat my-tmp-dir "backup/"))

(if (not (file-directory-p my-tmp-dir))     (make-directory my-tmp-dir))
(if (not (file-directory-p my-history-dir)) (make-directory my-history-dir))
(if (not (file-directory-p my-backup-dir))  (make-directory my-backup-dir))

(defun my-set-history (&rest args)
  (concat my-history-dir (mapconcat 'identity args "")))

;; backup
(add-to-list 'backup-directory-alist (cons "." my-backup-dir))

(if (eq system-type 'windows-nt) ;; no user-full-name on windows emacs env.
    (custom-set-variables '(user-full-name (getenv "USERNAME"))))

;; trash
(when (not (functionp 'system-move-file-to-trash))
  ;; system-move-file-to-trashが環境で定義されていないときに使われる。
  (custom-set-variables '(trash-directory "~/.Trash"))
  (if (not (file-directory-p trash-directory)) (make-directory trash-directory)))

(setq-default
 ;; auto-save
 auto-save-file-name-transforms `((".*" ,my-backup-dir t))
 ;; auto-save-list
 auto-save-list-file-prefix (my-set-history "auto-save-list/.saves-")
 ;; bookmark
 bookmark-default-file (my-set-history "bookmark-" system-name)
 ;; tramp cache
 tramp-persistency-file-name (my-set-history "tramp-" system-name)
 ;; tramp backup
 tramp-backup-directory-alist backup-directory-alist
 ;; savehist (minibuffer histoy is saved if savehist-mode is on)
 savehist-file (my-set-history "savehist-" system-name)
 ;; recentf
 ;; '(recentf-save-file (my-set-history "recentf-" system-name)) これはマシンローカルがいい気がする
 ;; save-place
 save-place-file (my-set-history "places-" system-name)
 ;; abbrev
 abbrev-file-name (concat my-tmp-dir "abbrev_defs")
 ;; ido
 ido-save-directory-list-file (my-set-history "ido.list-" (system-name))
 ;; url-cache
 url-cache-directory (concat my-tmp-dir "url/cache")

 ;; 外部拡張

 ;; save-kill  - helm-ringがあるから使わないんだが。。
 save-kill-file-name (my-set-history "kill-ring-saved")
 ;; undohist
 undohist-directory (expand-file-name "~/.undohist")
 ;; auto-complete
 ac-comphist-file (my-set-history "ac-comphist.dat-" system-name)
 ;; multiple-cursors
 mc/list-file (my-set-history "mc-lists.el-" system-name)
 ;; request
 request-storage-directory (my-set-history "request-" system-name)
 ;; helm-github-stars
 helm-github-stars-cache-file (my-set-history "helm-github-stars-cache" system-name)
 ;; helm-recentd
 helm-recentd-file (my-set-history "helm-recentd-" system-name))

(provide 'init-directory)
