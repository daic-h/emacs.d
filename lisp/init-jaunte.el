(lazyload (jaunte) "jaunte"
  (set-face-foreground 'jaunte-hint-face "white")
  (set-face-background 'jaunte-hint-face "#002b36")
  (set-face-foreground 'jaunte-hint-face2 "white")
  (set-face-background 'jaunte-hint-face2 "#657b83"))

(global-set-key (kbd "C-c C-j") 'jaunte)

(provide 'init-jaunte)
