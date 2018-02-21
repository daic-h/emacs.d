;;
;; descbinds
;;
(require 'helm-descbinds)
(helm-descbinds-mode 1)

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
;; helm-ag
;;
(lazyload (helm-ag) "helm-ag"
  (setq helm-ag-base-command "rg --vimgrep --no-heading")
  ;; (setq helm-ag-insert-at-point 'symbol)
  (setq helm-ag-insert-at-point nil))
(global-set-key (kbd "C-c C-'") 'helm-ag)
(global-set-key (kbd "C-c C-t") 'helm-ag-pop-stack)
(global-set-key (kbd "C-M-g") 'helm-ag)
(defun helm-ag-dot-emacs ()
  ".emacs.d以下を検索"
  (interactive)
  (helm-ag "~/.emacs.d/"))

(provide 'init-helm-ext)
