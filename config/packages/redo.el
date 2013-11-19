;; (install-elisp "http://http;//www.emacswiki.org/emacs/download/redo+.el")
(when (require 'redo+ nil t)
  (global-set-key (kbd "C-r") 'redo))

