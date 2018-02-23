(when (memq window-system '(mac ns))
  (let* ((asciifont "Menlo")
         (jpfont "Hiragino Maru Gothic ProN")
         (size 14)
         (h (* size 10)))
    (set-face-attribute 'default nil :family asciifont :height h)
    (set-fontset-font t 'katakana-jisx0201 jpfont)
    (set-fontset-font t 'japanese-jisx0208 jpfont)
    (set-fontset-font t 'japanese-jisx0212 jpfont)
    (set-fontset-font t 'japanese-jisx0213-1 jpfont)
    (set-fontset-font t 'japanese-jisx0213-2 jpfont)
    (set-fontset-font t '(#x0080 . #x024F) asciifont))

  ;; フォントサイズの比を設定
  (dolist (elt '((".*-Hiragino Maru Gothic ProN-.*" . 1.0)
                 ("^-apple-hiragino.*" . 1.2)
                 (".*osaka-bold.*" . 1.2)
                 (".*osaka-medium.*" . 1.2)
                 (".*monaco cy-bold-.*-mac-cyrillic" . 0.9)
                 (".*monaco-bold-.*-mac-roman" . 0.9)
                 (".*courier-bold-.*-mac-roman" . 1.0)
                 ("-cdac$" . 1.3)))
    (add-to-list 'face-font-rescale-alist elt))

  ;; C-x 5 2 で新しいフレームを作ったときに同じフォントを使う
  (setq frame-inherited-parameters '(font tool-bar-lines)))

;; (setq-default line-spacing 0)

(require 'all-the-icons)


(provide 'init-fonts)
