;; ElScreen
(require 'elscreen)
(elscreen-start)

(setq elscreen-display-tab nil)
(setq elscreen-display-screen-number nil)
(setq elscreen-tab-display-control nil)
(setq elscreen-tab-display-kill-screen nil)

;; (defvar elscreen-my-title-maps '()) ; タイトルの変換をする
;;
;; (defun my-elscreen-truncate-screen-name (screen-name truncate-length &optional padding)
;;   (let ((truncate-length (max truncate-length 4)))
;;     (cond
;;      ((> (string-width screen-name) truncate-length)
;;       (concat (truncate-string-to-width screen-name truncate-length nil) "~"))
;;      (padding
;;       (truncate-string-to-width screen-name truncate-length nil ?\ ))
;;      (t
;;       screen-name))))
;;
;; (defun elscreen-frame-title-update ()
;;   (when (elscreen-screen-modified-p 'elscreen-frame-title-update)
;;     (let*
;;         ((screen-list (sort (elscreen-get-screen-list) '<))
;;          (screen-to-name-alist (elscreen-get-screen-to-name-alist))
;;          (tab-width (elscreen-tab-width))
;;          (title (mapconcat
;;                  (lambda (screen)
;;                    (format
;;                     "%s"
;;                     (let ((label (elscreen-tab-escape-%
;;                                   (my-elscreen-truncate-screen-name
;;                                    (reduce (lambda (x f) (funcall f x)) elscreen-my-title-maps
;;                                            :initial-value (cdr (assoc screen screen-to-name-alist)))
;;                                    tab-width t))))
;;                       (if (eq screen (elscreen-get-current-screen))
;;                           (concat "【" label "】") label))))
;;                  screen-list " ")))
;;       (if (fboundp 'set-frame-name)
;;           (set-frame-name title)
;;         (setq frame-title-format title)))))
;;
;; (eval-after-load "elscreen"
;;   '(add-hook 'elscreen-screen-update-hook 'elscreen-frame-title-update))

(global-set-key (kbd "C-z C-b") 'helm-elscreen)

(provide 'init-elscreen)
