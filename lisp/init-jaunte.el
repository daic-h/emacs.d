(lazyload (jaunte) "jaunte"
  (set-face-foreground 'jaunte-hint-face "white")
  (set-face-background 'jaunte-hint-face "#002b36")
  (set-face-foreground 'jaunte-hint-face2 "white")
  (set-face-background 'jaunte-hint-face2 "#657b83"))

;; (define-key global-map (kbd "C-c SPC") 'jaunte)
(global-set-key (kbd "C-c j") 'jaunte)

(provide 'init-jaunte)
