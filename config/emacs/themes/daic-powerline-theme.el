;;; daic-h-theme.el --- Daic-h's color theme for GNU Emacs 24
;; Author: Daichi Hirata
;; Version: 1.0.0
;;
;; Ported theme to Emacs 24 color theme Nick Parker <nickp@developernotes.com>
;; original from Will Farrington <wcfarrington@gmail.com>
;;
;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation; either version 3 of
;; the License, or (at your option) any later version.
;;
;; This program is distributed in the hope that it will be
;; useful, but WITHOUT ANY WARRANTY; without even the implied
;; warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
;; PURPOSE.  See the GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public
;; License along with this program; if not, write to the Free
;; Software Foundation, Inc., 59 Temple Place, Suite 330, Boston,
;; MA 02111-1307 USA
(deftheme daic-powerline "color theme")

(custom-theme-set-faces 'daic-powerline
 '(default                         ((t (:background "#272821" :foreground "#F8F8F2"))))
 '(fringe                          ((t (:background "#272821"))))
 '(cursor                          ((t (:background "OliveDrab3"))))
 '(region                          ((t (:background "#0D628C"))))
 '(highlight                       ((t (:background "#D62E00"))))
 '(font-lock-builtin-face          ((t (:foreground "#A6E22A"))))
 '(font-lock-comment-face          ((t (:foreground "#75715D" :slant italic))))
 '(font-lock-constant-face         ((t (:foreground "#A6E22A"))))
 '(font-lock-doc-string-face       ((t (:foreground "#65B042"))))
 '(font-lock-function-name-face    ((t (:foreground "#F1266F" :slant italic))))
 '(font-lock-keyword-face          ((t (:foreground "#66D9EF"))))
 '(font-lock-string-face           ((t (:foreground "#DFD874"))))
 '(font-lock-type-face             ((t (:foreground "#89BDFF" :underline t))))
 '(font-lock-variable-name-face    ((t (:foreground "#3387cc"))))
 '(font-lock-warning-face          ((t (:foreground "#A6E22A" :bold t))))

 ;; ElScreen
 '(elscreen-tab-background-face     ((t (:background "#272821"))))
 '(elscreen-tab-current-screen-face ((t (:foreground "#272821" :background "OliveDrab3"
                                         :box (:line-width 1 :style released-button :color "OliveDrab3")))))
 '(elscreen-tab-other-screen-face   ((t (:foreground "gray60" :background "#272821" :underline nil)))))

(provide-theme 'daic-powerline)
;;; daic-h-theme.el ends here
