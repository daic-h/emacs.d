(require 'diff-mode)

(set-face-attribute 'diff-added-face nil
                    :background nil :foreground "green"
                    :weight 'normal)

(set-face-attribute 'diff-removed-face nil
                    :background nil :foreground "firebrick1"
                    :weight 'normal)

(set-face-attribute 'diff-file-header-face nil
                    :background nil :weight 'extra-bold)

(set-face-attribute 'diff-hunk-header-face nil
                    :foreground "chocolate4"
                    :background "white" :weight 'extra-bold
                    :underline t :inherit nil)
