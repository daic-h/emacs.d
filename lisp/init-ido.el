;; Use C-f during file selection to switch to regular find-file
(setq ido-save-directory-list-file
      (concat user-emacs-directory "tmp/cache/ido." (system-name) ".last"))

(ido-mode t)
(ido-everywhere t)
(setq ido-enable-flex-matching t)
(setq ido-use-filename-at-point nil)
(setq ido-auto-merge-work-directories-length 0)
(setq ido-use-virtual-buffers t)

;; Allow the same buffer to be open in different frames
(setq ido-default-buffer-method 'selected-window)

(when (eval-when-compile (< emacs-major-version 24))
 (defun sanityinc/ido-choose-from-recentf ()
   "Use ido to select a recently opened file from the `recentf-list'"
   (interactive)
   (if (and ido-use-virtual-buffers (fboundp 'ido-toggle-virtual-buffers))
       (ido-switch-buffer)
     (find-file (ido-completing-read "Open file: " recentf-list nil t))))

 (global-set-key [(meta f11)] 'sanityinc/ido-choose-from-recentf))

(provide 'init-ido)