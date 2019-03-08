;;----------------------------------------------------------------------------
;; Stop C-z from minimizing windows under OS X
;;----------------------------------------------------------------------------
(defun maybe-suspend-frame ()
  (interactive)
  (unless (and (eq system-type 'darwin) window-system)
    (suspend-frame)))

(global-set-key (kbd "C-z") 'maybe-suspend-frame)

;;----------------------------------------------------------------------------
;; Suppress GUI features
;;----------------------------------------------------------------------------
(setq use-file-dialog nil)
(setq use-dialog-box nil)
(setq inhibit-startup-screen t)
(setq inhibit-startup-echo-area-message t)

;;----------------------------------------------------------------------------
;; Show a marker in the left fringe for lines not in the buffer
;;----------------------------------------------------------------------------
(setq-default indicate-empty-lines t)
(setq-default indicate-buffer-boundaries 'right)

;;----------------------------------------------------------------------------
;; Window size and features
;;----------------------------------------------------------------------------
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))

(when (fboundp 'set-scroll-bar-mode)
  (set-scroll-bar-mode nil))

;;----------------------------------------------------------------------------
;; Nice scroll
;;----------------------------------------------------------------------------
(setq scroll-margin 0
      scroll-conservatively 100000
      scroll-preserve-screen-position 1)

(provide 'init-gui-frames)
