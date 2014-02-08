(require 'flycheck)
(add-hook 'after-init-hook 'global-flycheck-mode)

;; Override default flycheck triggers
(setq flycheck-check-syntax-automatically '(save idle-change mode-enabled)
      flycheck-idle-change-delay 0.8)

(after-load 'flycheck
  (define-key global-map (kbd "M-n") 'flycheck-next-error)
  (define-key global-map (kbd "M-p") 'flycheck-previous-error)
  (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc)))

(defun my-emacs-lisp-hook ()
  (setq flycheck-emacs-lisp-load-path load-path))

(add-hook 'emacs-lisp-mode-hook #'my-emacs-lisp-hook)


(provide 'init-flycheck)
