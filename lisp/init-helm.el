(require 'helm-config)
(require 'helm-files)

(remove-hook 'kill-emacs-hook 'helm-adaptive-save-history)

(defadvice helm-buffers-sort-transformer (around ignore activate)
  (setq ad-return-value (ad-get-arg 0)))

;; configuration helm variable
(setq helm-idle-delay 0.1)
(setq helm-input-idle-delay 0)
(setq helm-candidate-number-limit 500)
(setq helm-ff-transformer-show-only-basename nil)
(setq helm-buffer-max-length 50)

(define-key helm-map (kbd "C-h") 'delete-backward-char)
(define-key helm-map (kbd "C-k") 'kill-line)

(global-set-key (kbd "C-M-'") 'helm-imenu)
(global-set-key (kbd "M-x") 'helm-M-x)

(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-x C-b") 'helm-mini)

(global-set-key (kbd "M-r") 'helm-resume)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-s") 'helm-occur)

(provide 'init-helm)
