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

;;----------------------------------------------------------------------------
;; 透明度 (active . inactive)
;;----------------------------------------------------------------------------
(defun adjust-opacity (frame incr)
  (let* ((oldalpha (or (frame-parameter frame 'alpha) 100))
         (newalpha (+ incr oldalpha)))
    (when (and (<= frame-alpha-lower-limit newalpha) (>= 100 newalpha))
      (modify-frame-parameters frame (list (cons 'alpha newalpha))))))

(global-set-key (kbd "M-C-8") '(lambda () (interactive) (adjust-opacity nil -5)))
(global-set-key (kbd "M-C-9") '(lambda () (interactive) (adjust-opacity nil 5)))
(global-set-key (kbd "M-C-0") '(lambda () (interactive) (modify-frame-parameters nil `((alpha . 100)))))

;;----------------------------------------------------------------------------
;; フルスクリーンの切り替え
;;----------------------------------------------------------------------------
(when (eq system-type 'darwin)
  (setq ns-use-native-fullscreen nil)
  ;; (setq ns-use-native-fullscreen t)
  (define-key global-map (kbd "M-RET") 'toggle-frame-maximized)
  (define-key global-map (kbd "C-M-RET") 'toggle-frame-fullscreen))

(add-hook 'after-make-frame-functions
          (lambda (frame)
            (with-selected-frame frame
              (unless window-system
                (set-frame-parameter nil 'menu-bar-lines 0)))))

(setq frame-title-format
      '((:eval (if (buffer-file-name)
                   (abbreviate-file-name (buffer-file-name))
                 "%b"))))

;; ** New Core Text based font backend for Mac OS X 10.5 and newer.
;; To use the old font backend, use the following on the command line:
;;   % defaults write org.gnu.Emacs FontBackend ns
;; GNUstep and Mac OS X 10.4 use the old font backend.

;; defaults delete org.gnu.Emacs FontBackend

(provide 'init-gui-frames)
