;; (add-to-list 'load-path "~/.emacs.d/lisp/themes")
(add-to-list 'custom-theme-load-path "~/.emacs.d/lisp/themes")

(let ((theme 'railscasts))
  (load-theme theme t)
  (let ((bg (background-color-at-point)))
    (custom-theme-set-faces theme
     ;; fringeは常に背景色
     `(fringe ((t (:background ,bg)))))))

(provide 'init-themes)
