;;----------------------------------------------------------------------------
;; Delete the current file
;;----------------------------------------------------------------------------
(defun delete-this-file ()
  "Delete the current file, and kill the buffer."
  (interactive)
  (or (buffer-file-name) (error "No file is currently being edited"))
  (when (yes-or-no-p (format "Really delete '%s'?"
                             (file-name-nondirectory buffer-file-name)))
    (delete-file (buffer-file-name))
    (kill-this-buffer)))

;;----------------------------------------------------------------------------
;; Rename the current file
;;----------------------------------------------------------------------------
(defun rename-this-file-and-buffer (new-name)
  "Renames both current buffer and file it's visiting to NEW-NAME."
  (interactive "sNew name: ")
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (unless filename
      (error "Buffer '%s' is not visiting a file!" name))
    (if (get-buffer new-name)
        (message "A buffer named '%s' already exists!" new-name)
      (progn
        (when (file-exists-p filename)
         (rename-file filename new-name 1))
        (rename-buffer new-name)
        (set-visited-file-name new-name)))))

;;----------------------------------------------------------------------------
;; Browse current HTML file
;;----------------------------------------------------------------------------
(defun browse-current-file ()
  "Open the current file as a URL using `browse-url'."
  (interactive)
  (let ((file-name (buffer-file-name)))
    (if (tramp-tramp-file-p file-name)
        (error "Cannot open tramp file")
      (browse-url (concat "file://" file-name)))))

;; URLをewwかブラウザの選択
;;_______________________________________________________________
(defun choose-browser (url &rest args)
  (interactive "sURL: ")
  (if (y-or-n-p "Use external browser? ")
      (browse-url-default-macosx-browser url)
    (eww-browse-url url)))
(setq browse-url-browser-function #'choose-browser)

;; scratchバッファの保存とリストア
;;_______________________________________________________________
(defun save-scratch-data ()
  (if (get-buffer "*scratch*")
      (let* ((str (progn (set-buffer (get-buffer "*scratch*"))
                         (buffer-substring-no-properties (point-min) (point-max))))
             (file (concat user-emacs-directory "tmp/scratch-" (system-name)))
             (buf (or (get-file-buffer (expand-file-name file))
                      (find-file-noselect file))))
        (set-buffer buf)
        (erase-buffer)
        (insert str)
        (save-buffer)
        (kill-buffer buf))))

(defadvice save-buffers-kill-emacs (before save-scratch-buffer activate)
  (save-scratch-data))

(defun read-scratch-data ()
  (let ((file (concat user-emacs-directory "tmp/scratch-" (system-name))))
    (when (file-exists-p file)
      (set-buffer (get-buffer "*scratch*"))
      (erase-buffer)
      (insert-file-contents file))))
(read-scratch-data)

;; don't kill *scratch*
(defun unkillable-scratch-buffer ()
  (if (equal (buffer-name (current-buffer)) "*scratch*")
      (progn (delete-region (point-min) (point-max)) nil)
    t))
(add-hook 'kill-buffer-query-functions #'unkillable-scratch-buffer)


;; 所有者がrootだった場合にsudoで開くかを確認する
;;_______________________________________________________________
(defun file-root-p (filename)
  (eq 0 (nth 2 (file-attributes filename))))

(defun th-rename-tramp-buffer ()
  (when (file-remote-p (buffer-file-name))
    (rename-buffer
     (format "%s:%s" (file-remote-p (buffer-file-name) 'method) (buffer-name)))))
(add-hook 'find-file-hook #'th-rename-tramp-buffer)

(defadvice find-file (around th-find-file activate)
  (if (and (file-root-p (ad-get-arg 0))
           (not (file-writable-p (ad-get-arg 0)))
           (y-or-n-p (concat "File " (ad-get-arg 0) " is read-only.  Open it as root? ")))
      (th-find-file-sudo (ad-get-arg 0))
    ad-do-it))

(defun th-find-file-sudo (file)
  (interactive "F")
  (set-buffer (find-file (concat "/sudo::" file))))

;; 一時的なファイルを作成する
;;_______________________________________________________________
(defun open-junk-file ()
  (interactive)
  (let* ((file (expand-file-name
                (format-time-string "%Y/%m/%Y-%m-%d-%H%M%S." (current-time))
                (concat user-emacs-directory "tmp/junk")))
         (dir (file-name-directory file)))
    (make-directory dir t)
    (find-file-other-window (read-string "Junk Code: " file))))

;; 変更されてないバッファーを全部閉じる。ただし、*...* 名（*scratch* など）は除く。
;;_______________________________________________________________
(defun close-all-unmodified-buffer ()
  (interactive)
  (let ((buffers (buffer-list)))
    (mapcar
     #'(lambda (buf)
         (if (and (not (buffer-modified-p buf))
                  (not (string-match "^\\*.+\\*$" (buffer-name buf))))
             (kill-buffer buf)))
     buffers))
  (switch-to-buffer "*scratch*"))

(provide 'init-user-function)
