(require 'multi-term)
(setq multi-term-program "/usr/local/bin/zsh")

(add-hook 'term-mode-hook
 (lambda ()
   (let* ((key-and-func
           `(("\C-p"           term-send-previous-line)
             ("\C-n"           term-send-next-line)
             ("\C-b"           term-send-backward-char)
             ("\C-f"           term-send-forward-char)
             (,(kbd "C-h")     term-send-backspace)
             (,(kbd "C-y")     term-paste)
             (,(kbd "ESC ESC") term-send-raw)
             (,(kbd "C-S-p")   multi-term-prev)
             (,(kbd "C-S-n")   multi-term-next)
             ("\C-r"           helm-shell-history))))
     (loop for (keybind function) in key-and-func do
           (define-key term-raw-map keybind function)))))
