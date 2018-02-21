(elscreen-start)
(setq elscreen-display-tab nil)
(setq elscreen-display-screen-number nil)
(setq elscreen-tab-display-kill-screen nil)
(setq elscreen-buffer-to-nickname-alist nil)
(setq-default elscreen-mode-line-string nil)
(remove-hook 'elscreen-screen-update-hook 'elscreen-mode-line-update)

(global-set-key (kbd "C-z C-b") 'helm-elscreen)

;; (defun elscreen--convert-name (screen-name)
;;   (let ((case-fold-search nil))
;;     (cond ((string-match-p "Minibuf" screen-name)
;;            (replace-regexp-in-string "\\*Minibuf-\\w\\*" "" screen-name))
;;           (t screen-name))))

;; (defun elscreen-update-frame-title ()
;;   (interactive)
;;   (when (elscreen-screen-modified-p 'elscreen-frame-title-update)
;;     (cl-loop with sort-func = (lambda (a b) (< (car a) (car b)))
;;              with screen-list = (cl-copy-list (elscreen-get-screen-to-name-alist))
;;              for (index . name) in (sort screen-list sort-func)
;;              for status = (elscreen-status-label index)
;;              for name = (elscreen--convert-name name)
;;              collect (format "%d: | %s |%s" index name status) into screen-names
;;              finally
;;              (set-frame-name (mapconcat #'identity screen-names " ")))))

;; (add-hook 'elscreen-screen-update-hook 'elscreen-update-frame-title)

(provide 'init-elscreen)
