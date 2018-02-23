;;----------------------------------------------------------------------------
;; Navigate window layouts with "C-c <left>" and "C-c <right>"
;;----------------------------------------------------------------------------
;; (winner-mode 1)

;;----------------------------------------------------------------------------
;; ウィンドウサイズをC-q C-rで変更(hjkl操作)
;;----------------------------------------------------------------------------
(defun window-resizer ()
  "Control window size and position."
  (interactive)
  (let ((window-obj (selected-window))
        (current-width (window-width))
        (current-height (window-height))
        (dx (if (= (nth 0 (window-edges)) 0) 1 -1))
        (dy (if (= (nth 1 (window-edges)) 0) 1 -1))
        action c)
    (catch 'end-flag
      (while t
        (setq action
              (read-key-sequence-vector
               (format "size[%dx%d]" (window-width) (window-height))))
        (setq c (aref action 0))
        (cond ((= c ?l) (enlarge-window-horizontally dx))
              ((= c ?h) (shrink-window-horizontally dx))
              ((= c ?j) (enlarge-window dy))
              ((= c ?k) (shrink-window dy))
              ;; otherwise
              (t (let ((last-command-event (aref action 0)) (command (key-binding action)))
                   (when command (call-interactively command)))
                 (message "Quit")
                 (throw 'end-flag t)))))))

(define-key global-map (kbd "C-q") (make-sparse-keymap))
(define-key global-map (kbd "C-q C-q") #'quoted-insert)
(define-key global-map (kbd "C-q C-r") #'window-resizer)
(define-key global-map (kbd "C-q C-l") #'windmove-right)
(define-key global-map (kbd "C-q C-h") #'windmove-left)
(define-key global-map (kbd "C-q C-j") #'windmove-down)
(define-key global-map (kbd "C-q C-k") #'windmove-up)

(provide 'init-windows)
