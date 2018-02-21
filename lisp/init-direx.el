(push '(direx:direx-mode :position left :width 50 :dedicated t)
      popwin:special-display-config)

(global-set-key (kbd "C-x C-j") 'direx-project:jump-to-project-root-other-window)

(provide 'init-direx)
