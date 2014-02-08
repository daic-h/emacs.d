(require 'dired+)

(put 'dired-find-alternate-file 'disabled nil)
(setq diredp-hide-details-initially-flag nil)

(when (fboundp 'global-dired-hide-details-mode)
  (global-dired-hide-details-mode -1))

(setq dired-recursive-deletes 'top)

(provide 'init-dired)
