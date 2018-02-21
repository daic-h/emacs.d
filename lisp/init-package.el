(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(package-refresh-contents)

(defvar my/favorite-packages
  '(
    vue-mode
    ))

(dolist (package my/favorite-packages)
  (unless (package-installed-p package)
    (package-install package)))

(provide 'init-package)
