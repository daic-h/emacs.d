(setq-default recentf-save-file "~/.recentf")

(setq recentf-max-saved-items 1000
      recentf-exclude '("/tmp/" "/ssh:"))

(recentf-mode 1)

(provide 'init-recentf)
