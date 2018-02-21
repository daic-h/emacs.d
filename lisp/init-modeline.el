;; (setq ns-use-srgb-colorspace t)
(require 'spaceline-config)
(spaceline-emacs-theme)
(spaceline-helm-mode)

(setq powerline-height 20)
;; (setq powerline-raw " ")
(setq spaceline-separator-dir-left '(left . left))
(setq spaceline-separator-dir-right '(right . right))

;; ;; 時計表示
;; (setq display-time-string-forms '(month "/" day " " dayname " " 24-hours ":" minutes))
;; (display-time)

;; ;; Extra mode line faces
;; (make-face 'mode-line-read-only-face)
;; (make-face 'mode-line-modified-face)
;; (make-face 'mode-line-folder-face)
;; (make-face 'mode-line-filename-face)
;; (make-face 'mode-line-position-face)
;; (make-face 'mode-line-mode-face)
;; (make-face 'mode-line-minor-mode-face)
;; (make-face 'mode-line-process-face)
;; (make-face 'mode-line-80col-face)
;; (make-face 'mode-line-delim-face-1)

;; ;; mode-line表示設定
;; (setq mode-line-cleaner-alist '((abbrev-mode . "")
;;                                 (git-gutter-mode . "") ;; GitGutter
;;                                 (flex-autopair-mode . "") ;; FA
;;                                 (auto-complete-mode . "") ;; AC
;;                                 (smooth-scroll-mode . "") ;; SScr
;;                                 (auto-highlight-symbol-mode . "") ;; HS
;;                                 ;; Major modes
;;                                 (lisp-interaction-mode . "Li")
;;                                 (ruby-mode   . "Rb")
;;                                 (emacs-lisp-mode . "El")))

;; (defun clean-mode-line ()
;;   (interactive)
;;   (loop for (mode . mode-str) in mode-line-cleaner-alist
;;         do
;;         (let ((old-mode-str (cdr (assq mode minor-mode-alist))))
;;           (when old-mode-str
;;             (setcar old-mode-str mode-str))
;;           ;; major mode
;;           (when (eq mode major-mode)
;;             (setq mode-name mode-str)))))

;; (add-hook 'after-change-major-mode-hook 'clean-mode-line)

;; (defun count-lines-and-chars ()
;;   (if mark-active
;;       (format " %3d lines, %4d chars "
;;               (count-lines (region-beginning) (region-end))
;;               (- (region-end) (region-beginning)))
;;     ""))

;; ;; Helper function
;; (defun shorten-directory (dir max-length)
;;   "Show up to `max-length' characters of a directory name `dir'."
;;   (let ((path (reverse (split-string (abbreviate-file-name dir) "/")))
;;         (output ""))
;;     (when (and path (equal "" (car path)))
;;       (setq path (cdr path)))
;;     (while (and path (< (length output) (- max-length 4)))
;;       (setq output (concat (car path) "/" output))
;;       (setq path (cdr path)))
;;     (when path
;;       (setq output (concat ".../" output)))
;;     output))

;; ;; Mode line setup
;; (setq-default mode-line-position
;;  '((:propertize "%4l" face mode-line-position-face)
;;    (:propertize "/" face mode-line-delim-face-1)
;;    (:eval (number-to-string (count-lines (point-min) (point-max))))
;;    " "
;;    ;; Position, including warning for 80 columns
;;    (:eval (propertize "%3c" 'face (if (>= (current-column) 80)
;;                                       'mode-line-80col-face
;;                                     'mode-line-position-face)))))

;; (setq-default mode-line-format
;;  '("%e "
;;    mode-line-mule-info
;;    (:eval (count-lines-and-chars))
;;    mode-line-position
;;    " "
;;    ;; directory and buffer/file name
;;    (:propertize (:eval (shorten-directory default-directory 30)) face mode-line-folder-face)
;;    (:propertize "%b" face mode-line-filename-face)
;;    " "
;;    mode-line-modified
;;    ;; narrow [default -- keep?]
;;    ;; " %n"
;;    ;; mode indicators: vc, recursive edit, major mode, minor modes, process, global
;;    " "
;;    (vc-mode vc-mode)
;;    ;; " %["
;;    " "
;;    (:propertize mode-name face mode-line-mode-face)
;;    ;; "%]"
;;    (:propertize (:eval (format-mode-line minor-mode-alist)) face mode-line-minor-mode-face)
;;    " "
;;    (:propertize mode-line-process face mode-line-process-face)
;;    global-mode-string))

;; (custom-set-faces
;;  '(mode-line                    ((t (:foreground "gray90"
;;                                      :background "gray10"
;;                                      :inverse-video nil
;;                                      :weight normal
;;                                      :height 120
;;                                      :box (:line-width 1 :color "gray20" :style nil)))))
;;  '(mode-line-inactive           ((t (:foreground "gray80"
;;                                      :background "gray30"
;;                                      :inverse-video nil
;;                                      :weight extra-light
;;                                      :height 120
;;                                      :box (:line-width 1 :color "gray30" :style nil)))))
;;  '(mode-line-folder-face        ((t (:foreground "gray90" :inherit mode-line-face :weight extra-light :height 110 ))))
;;  '(mode-line-filename-face      ((t (:foreground "#eab700" :inherit mode-line-face :weight normal :height 140))))
;;  '(mode-line-process-face       ((t (:foreground "#718c00" :inherit mode-line-face))))
;;  ;; '(mode-line-delim-face-1       ((t (:foreground "white" :inherit mode-line-face))))
;;  ;; '(mode-line-position-face      ((t (:inherit mode-line-face :family "monaco"))))
;;  '(mode-line-mode-face          ((t (:foreground "gray80" :inherit mode-line-face))))
;;  '(mode-line-minor-mode-face    ((t (:foreground "gray60" :inherit mode-line-mode-face :height 100))))
;;  '(mode-line-80col-face         ((t (:foreground "gray10" :background "#eab700" :inherit mode-line-position-face :weight bold)))))

(provide 'init-modeline)
