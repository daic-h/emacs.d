(setq undohist-directory (expand-file-name "~/.undohist"))

(require 'undohist)
(undohist-initialize)

(provide 'init-undohist)
