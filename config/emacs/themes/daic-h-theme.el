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

(deftheme daic-h "@Daic-h's color theme")

(custom-theme-set-faces
 'daic-h
 '(default                      ((t (:background "#111" :foreground "#ddd"))))
 '(cursor                       ((t (:background "#7a67ee"))))
 '(region                       ((t (:background "#483d8b"))))
 '(highlight                    ((t (:background "#4a410d" :bold t :italic t))))
 '(fringe                       ((t (:background "#111"    :foreground "#666"))))
 '(show-paren-match-face        ((t (:background "#7a67ee" :foreground "#eeeeec"))))
 '(show-paren-mismatch-face     ((t (:background "#ad7fa8" :foreground "#2e3436"))))

 '(font-lock-builtin-face       ((t (:foreground "#dd7b3b"))))
 '(font-lock-comment-face       ((t (:foreground "#666" :slant italic))))
 '(font-lock-constant-face      ((t (:foreground "#cf6a4c"))))
 '(font-lock-doc-string-face    ((t (:foreground "#9b859d"))))
 '(font-lock-function-name-face ((t (:foreground "#e9c062" :bold t))))
 '(font-lock-keyword-face       ((t (:foreground "#cf6a4c"))))
 '(font-lock-string-face        ((t (:foreground "#65b042"))))
 '(font-lock-type-face          ((t (:foreground "#c5af75"))))
 '(font-lock-variable-name-face ((t (:foreground "#3387cc"))))
 '(font-lock-warning-face       ((t (:background "#420e09" :foreground "#eeeeee" :bold t))))

 ;; ModeLine
 '(mode-line                    ((t (:foreground "#F8F8F2"
                                     :background "DarkSlateBlue"
                                     :inverse-video nil
                                     :weight normal
                                     :height 120
                                     :box (:line-width 1 :color "DarkSlateBlue" :style nil)))))
 '(mode-line-inactive           ((t (:foreground "gray90"
                                     :background "gray30"
                                     :inverse-video nil
                                     :weight extra-light
                                     :height 120
                                     :box (:line-width 1 :color "gray30" :style nil)))))
 '(mode-line-folder-face        ((t (:foreground "gray90" :inherit mode-line-face :weight extra-light :height 110 ))))
 '(mode-line-filename-face      ((t (:foreground "#eab700" :inherit mode-line-face :weight bold))))
 '(mode-line-position-face      ((t (:inherit mode-line-face :family "Menlo"))))
 '(mode-line-mode-face          ((t (:foreground "white" :inherit mode-line-face))))
 '(mode-line-minor-mode-face    ((t (:foreground "gray60" :inherit mode-line-mode-face :height 100))))
 '(mode-line-process-face       ((t (:foreground "#718c00" :inherit mode-line-face))))
 '(mode-line-80col-face         ((t (:foreground "black" :background "#eab700" :inherit mode-line-position-face))))
 '(mode-line-delim-face-1       ((t (:foreground "white" :inherit mode-line-face))))

 ;;AutoComplete
 '(ac-selection-face            ((t (:background "DarkSlateBlue"))))

 ;; ElScreen
 '(elscreen-tab-background-face     ((t (:background "#111111"))))
 '(elscreen-tab-current-screen-face ((t (:foreground "#F8F8F2" :background "DarkSlateBlue" :weight bold))))
 '(elscreen-tab-other-screen-face   ((t (:foreground "gray90" :background "gray30"))))

 '(isearch                      ((t (:background "#f57900" :foreground "#2e3436"))))
 '(lazy-highlight               ((t (:background "#e9b96e" :foreground "#2e3436"))))
 '(link                         ((t (:foreground "#729fcf"))))
 '(link-visited                 ((t (:foreground "#ad7fa8"))))

 '(flyspell-duplicate           ((t (:foreground "#fcaf3e"))))
 '(flyspell-incorrect           ((t (:foreground "#cc0000"))))

 '(org-date                     ((t (:foreground "LightSteelBlue" :underline t))))
 '(org-hide                     ((t (:foreground "#2e3436"))))
 '(org-todo                     ((t (:inherit font-lock-keyword-face :bold t))))
 '(org-level-1                  ((t (:inherit font-lock-function-name-face))))
 '(org-level-2                  ((t (:inherit font-lock-variable-name-face))))
 '(org-level-3                  ((t (:inherit font-lock-keyword-face))))
 '(org-level-4                  ((t (:inherit font-lock-string-face))))
 '(org-level-5                  ((t (:inherit font-lock-constant-face))))

 '(comint-highlight-input       ((t (:italic t :bold t))))
 '(comint-highlight-prompt      ((t (:foreground "#8ae234"))))
 '(isearch                      ((t (:background "#f57900" :foreground "#2e3436"))))
 '(isearch-lazy-highlight-face  ((t (:foreground "#2e3436" :background "#e9b96e"))))
 '(paren-face-match             ((t (:inherit show-paren-match-face))))
 '(paren-face-match-light       ((t (:inherit show-paren-match-face))))
 '(paren-face-mismatch          ((t (:inherit show-paren-mismatch-face))))
 '(persp-selected-face          ((t (:foreground "#729fcf")))))

(provide-theme 'daic-h)
;;; daic-h-theme.el ends here
