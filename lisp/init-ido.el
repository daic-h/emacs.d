;; Use C-f during file selection to switch to regular find-file
(ido-mode 1)
;; (ido-everywhere t)
(setq ido-enable-flex-matching t)
(setq ido-use-filename-at-point nil)
(setq ido-auto-merge-work-directories-length -1)
(setq ido-use-virtual-buffers t)

;; Allow the same buffer to be open in different frames
(setq ido-default-buffer-method 'selected-window)

(require 'ido-vertical-mode)
;; (setq ido-use-faces t)
;; (set-face-attribute 'ido-vertical-first-match-face nil
;;                     :background nil
;;                     :foreground "orange")
;; (set-face-attribute 'ido-vertical-only-match-face nil
;;                     :background nil
;;                     :foreground nil)
;; (set-face-attribute 'ido-vertical-match-face nil
;;                     :foreground nil)
(setq ido-vertical-define-keys 'C-n-and-C-p-only)
(ido-vertical-mode 1)

(provide 'init-ido)
