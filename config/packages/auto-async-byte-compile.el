(require 'auto-async-byte-compile)
(setq auto-async-byte-compile-init-file "~/.emacs.d/config/macros.el"
      auto-async-byte-compile-exclude-files-regexp "/config/")
(add-hook 'emacs-lisp-mode-hook 'enable-auto-async-byte-compile-mode)
