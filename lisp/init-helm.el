(require 'helm-config)
(require 'helm-files)

(remove-hook 'kill-emacs-hook 'helm-adaptive-save-history)

;; configuration helm variable
(setq helm-idle-delay 0.1)
(setq helm-input-idle-delay 0)
(setq helm-candidate-number-limit 500)

(define-key helm-map (kbd "C-h") 'delete-backward-char)
(define-key helm-map (kbd "C-k") 'kill-line)

(global-set-key (kbd "C-M-'") 'helm-imenu)
(global-set-key (kbd "M-x") 'helm-M-x)

(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-x C-b") 'helm-mini)

(global-set-key (kbd "M-r") 'helm-resume)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-s") 'helm-occur)

;;
;; extentions
;;
(require 'helm-growthforecast)

(require 'helm-descbinds)
(helm-descbinds-mode 1)

(require 'helm-ls-git)
(global-set-key (kbd "C-'") 'helm-ls-git-ls)

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

(require 'helm-swoop)

(global-set-key (kbd "M-i") 'helm-swoop)
(global-set-key (kbd "C-c M-i") 'helm-multi-swoop)
(global-set-key (kbd "C-x M-i") 'helm-multi-swoop-all)



;; Git
(defun helm-c-source-git-log (&optional target-file)
  (let ((file (or target-file ""))
        (regexp (concat "^\\([0-9]\\{4\\}-[0-9]\\{2\\}-[0-9]\\{2\\}\\)\s"
                        "\\([a-z0-9]\\{7\\}\\)\s\\((.*)\\)\s\\(.*\\)")))
    `((name . "Git Logs")
      (init . (lambda ()
                (with-current-buffer (helm-candidate-buffer 'global)
                  (call-process-shell-command
                   (format "git log --date=short --pretty=format:\"%%ad %%h (%%an) %%s\" %s" ,file) nil t nil))))
      (candidates-in-buffer)
      (candidate-transformer
       (lambda (candidate)
         (loop for line in candidate
               if (string-match ,regexp line)
               collect (format "%s %s %s %s"
                               (propertize (match-string 1 line) 'face '((t (:foreground "Skyblue1"))))
                               (propertize (match-string 2 line) 'face '((t (:foreground "Darkgoldenrod1"))))
                               (propertize (match-string 3 line) 'face '((t (:foreground "ForestGreen"))))
                               (match-string 4 line))
               else return (list line))))
      (action . (("Show Log" .
                  (lambda (candidate)
                    (let ((hash (progn (string-match ,regexp candidate)
                                       (match-string 2 candidate))))
                      (with-current-buffer (get-buffer-create "*helm-git-log*")
                        (setq buffer-read-only nil)
                        (erase-buffer)
                        (save-excursion
                          (call-process-shell-command
                           (format "git show %s %s" hash ,file) nil t nil))
                        (unless (eq major-mode 'diff-mode)
                          (diff-mode))
                        (setq buffer-read-only t)
                        (helm-switch-to-buffer (current-buffer)))))))))))

(defun helm-git-log ()
  (interactive)
  (helm :sources (helm-c-source-git-log)))

(defun helm-git-log-current-file ()
  (interactive)
  (helm :sources (helm-c-source-git-log (buffer-file-name))))

;; Ag
(defun helm-c-source-ag ()
  '((name . "Ag")
    (init . (lambda ()
              (let* ((dir (file-name-directory buffer-file-name))
                     (target-dir (read-string "target dir: " dir))
                     (target-word (read-string "ag: ")))
                (helm-attrset 'target-dir target-dir)
                (helm-attrset 'target-word target-word)
                (with-current-buffer (helm-candidate-buffer 'global)
                  (call-process-shell-command
                   (format "ag --smart-case --nogroup --column --line-numbers %s %s" target-word target-dir) nil t nil)))))
    (candidates-in-buffer)
    (candidate-transformer
     (lambda (candidate)
       (let ((target-dir (helm-attr 'target-dir))
             (target-word (helm-attr 'target-word)))
         (loop for line in candidate
               if (string-match "^\\(.*\\):\\([0-9]+\\):\\([0-9]+\\):\\(.*\\)$" line)
               collect (progn
                         (let ((file (replace-regexp-in-string
                                      target-dir "./" (match-string 1 line)))
                               (line (match-string 2 line))
                               (column (match-string 3 line))
                               (result (match-string 4 line)))
                           (format "%s:%s:%s: %s"
                                   (propertize   file 'face '(foreground-color . "Skyblue1"))
                                   line
                                   column
                                   ;; (propertize   line 'face '(foreground-color . "Green4"))
                                   ;; (propertize column 'face '(foreground-color . "Mediumorchid4"))
                                   (replace-regexp-in-string
                                    target-word (propertize target-word 'face '(foreground-color . "Darkgoldenrod1")) result))))
               else return (list line)))))
    (action . (("Action" . (lambda (candidate)
                             (let ((target-dir (helm-attr 'target-dir)))
                               (string-match "^\\(.*\\):\\([0-9]+\\):\\([0-9]+\\):\\(.*\\)$" candidate)
                               (let ((file (concat target-dir (match-string 1 candidate)))
                                     (line (match-string 2 candidate))
                                     (column (match-string 3 candidate)))
                                 (with-current-buffer (find-file-noselect file)
                                   (goto-line (string-to-int line))
                                   (move-to-column (1- (string-to-int column)))
                                   (helm-switch-to-buffer (current-buffer)))))))))))

(defun helm-ag ()
  (interactive)
  (helm :sources (helm-c-source-ag)))


(provide 'init-helm)
