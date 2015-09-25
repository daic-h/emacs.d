(let ((theme 'railscasts))
  (load-theme theme t)
  (let ((bg (background-color-at-point)))
    (custom-theme-set-faces theme `(fringe ((t (:background ,bg)))))))

(provide 'init-themes)
