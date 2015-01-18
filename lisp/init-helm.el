(require 'helm-config)
(require 'helm-files)

(remove-hook 'kill-emacs-hook 'helm-adaptive-save-history)

;; configuration helm variable
(setq helm-idle-delay 0.1)
(setq helm-input-idle-delay 0)
(setq helm-candidate-number-limit 500)
(setq helm-ff-transformer-show-only-basename nil)

(define-key helm-map (kbd "C-h") 'delete-backward-char)
(define-key helm-map (kbd "C-k") 'kill-line)

(global-set-key (kbd "C-M-'") 'helm-imenu)
(global-set-key (kbd "M-x") 'helm-M-x)

(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-x C-b") 'helm-mini)

(global-set-key (kbd "M-r") 'helm-resume)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-s") 'helm-occur)

;; extentions

;;
;; descbinds
;;
(require 'helm-descbinds)
(helm-descbinds-mode 1)

;;
;; helm-gtags
;;
(lazyload (helm-gtags-mode) "helm-gtags"
  ;; customize
  (setq helm-gtags-path-style 'relative)
  (setq helm-gtags-ignore-case t)
  (setq helm-gtags-read-only nil)
  ;; key bindings
  (local-set-key (kbd "M-t") 'helm-gtags-find-tag)
  (local-set-key (kbd "M-r") 'helm-gtags-find-rtag)
  (local-set-key (kbd "M-s") 'helm-gtags-find-symbol)
  (local-set-key (kbd "C-t") 'helm-gtags-pop-stack))

;;
;; helm-swoop
;;
(lazyload (helm-swoop helm-multi-swoop helm-multi-swoop-all) "helm-swoop")
(global-set-key (kbd "M-i") 'helm-swoop)
(global-set-key (kbd "C-c M-i") 'helm-multi-swoop)
(global-set-key (kbd "C-x M-i") 'helm-multi-swoop-all)

;;
;; helm-ls-git
;;
(lazyload (helm-ls-git-ls) "helm-ls-git")
(global-set-key (kbd "C-'") 'helm-ls-git-ls)

;;
;; helm-growthforecast
;;
(lazyload (helm-growthforecast) "helm-growthforecast")

(provide 'init-helm)
