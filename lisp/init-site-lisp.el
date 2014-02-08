(let ((default-directory (expand-file-name (concat user-emacs-directory "site-lisp/elisp"))))
  (add-to-list 'load-path default-directory)
  (normal-top-level-add-subdirs-to-load-path))

(setq package-user-dir (concat user-emacs-directory "site-lisp"))

(provide 'init-site-lisp)
