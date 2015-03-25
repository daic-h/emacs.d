(add-to-list 'custom-theme-load-path (concat user-emacs-directory "lisp/themes"))

;; darktooth
;; railscasts
(let ((theme 'railscasts))
  (load-theme theme t)
  (let ((bg (background-color-at-point)))
    (custom-theme-set-faces theme
     ;; fringeは常に背景色
     `(fringe ((t (:background ,bg)))))))

(provide 'init-themes)
