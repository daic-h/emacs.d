(require 'neotree)

(setq neo-theme (if (display-graphic-p) 'icons 'arrow))

(global-set-key (kbd "C-x C-j") 'neotree-toggle)

(provide 'init-neotree)
