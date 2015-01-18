(add-hook-fn 'tramp
  (setq tramp-default-method "ssh")
  (setenv "SHELL" "/bin/bash"))

(provide 'init-tramp)
