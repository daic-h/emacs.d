;; Use C-f during file selection to switch to regular find-file
(setq ido-save-directory-list-file
      (concat user-emacs-directory "tmp/cache/ido." (system-name) ".last"))

(ido-mode t)
(ido-everywhere t)
(setq ido-enable-flex-matching t)
(setq ido-use-filename-at-point nil)
(setq ido-auto-merge-work-directories-length -1)
(setq ido-use-virtual-buffers t)

;; Allow the same buffer to be open in different frames
(setq ido-default-buffer-method 'selected-window)

(provide 'init-ido)
