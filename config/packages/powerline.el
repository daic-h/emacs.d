(require 'powerline)

;; (let ((color1 "#cc6600")
;;       (color1-inactive "#cc9999")
;;       (color2 "#cc9999")
;;       (color3 "#ffcc99")
;;       (color1-fg "#000000")
;;       (color1-inactive-fg "#000000"))
;;   (custom-set-faces
;;    ;; アクティブ時
;;    `(mode-line ((t (:foreground ,color1-fg :background ,color1 :box nil))))
;;    ;; 非アクティブ時
;;    `(mode-line-inactive ((t (:foreground ,color1-inactive-fg :background ,color1-inactive :box nil)))))

;;   ;; モードライン2色目
;;   (setq powerline-color1 color2)

;;   ;; モードライン3色目
;;   (setq powerline-color2 color3))



;;Base
;;-------------------------------------------

;; best for small fonts
(setq powerline-arrow-shape 'arrow14)

;; 右部分の位置合わせ(右端から何文字分を左に寄せるか、デフォルト+15文字)
(defun powerline-make-fill (color)
  (let ((plface (powerline-make-face color)))
    (if (eq 'right (get-scroll-bar-mode))
      (propertize " " 'display '((space :align-to (- right-fringe 32))) 'face plface)
      (propertize " " 'display '((space :align-to (- right-fringe 35))) 'face plface))))

(defpowerline row     "%l") ; 行番号の書式
(defpowerline column  "%c") ; 列番号の書式
(defpowerline percent "%p") ; カーソル位置の割合
(defpowerline time    "%M") ; 時計の書式

;; Powerlineの書式
(setq-default mode-line-format
 (list '(" " mode-line-mule-info mode-line-modified)
       '(:eval (concat
                (powerline-buffer-id   'left   nil powerline-color1)
                (powerline-major-mode  'left       powerline-color1)
                (powerline-make-text   " "         powerline-color1)
                (powerline-minor-modes 'left       powerline-color1)
                (powerline-narrow      'left       powerline-color1 powerline-color2)
                (powerline-vc          'center                      powerline-color2)
                (powerline-make-fill                                powerline-color2)
                (powerline-row         'right      powerline-color1 powerline-color2)
                (powerline-make-text   ": "        powerline-color1)
                (powerline-column      'right      powerline-color1)
                (powerline-percent     'right      powerline-color1)
                (powerline-time        'right  nil powerline-color1)
                (powerline-make-text   "  "    nil )))))
