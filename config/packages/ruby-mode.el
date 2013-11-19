(require 'ruby-mode)

;; set ruby-mode indent
(setq ruby-indent-level 2)
(setq ruby-indent-tabs-mode nil)

(require 'ruby-electric)
(setq ruby-electric-expand-delimiters-list nil)

(require 'ruby-block)
(ruby-block-mode t)
(setq ruby-block-highlight-toggle t)

(add-hook 'ruby-mode-hook (lambda ()
   (setq show-trailing-whitespace nil)

   (ruby-electric-mode t)
   ;; Flymake
   (flymake-mode t)))

;; (lazyload (ruby-mode) "ruby-mode"
;;  ;; set ruby-mode indent
;;  (setq ruby-indent-level 2)
;;  (setq ruby-indent-tabs-mode nil)

;;  (require 'ruby-electric)
;;  (add-hook 'ruby-mode-hook '(lambda () (ruby-electric-mode t)))
;;  (setq ruby-electric-expand-delimiters-list nil)

;;  (require 'ruby-block)
;;  (ruby-block-mode t)
;;  (setq ruby-block-highlight-toggle t)

;;  ;; Flymake
;;  (flymake-mode t))

(add-to-auto-mode-fn 'ruby-mode
 '("[Rr]akefile" "\\.gemspec" "Gemfile" "Guardfile"))

;;; Rails
;; rhtml-mode
(lazyload (rhtml-mode) "rhtml-mode"
 (require 'rinari)
 (rinari-launch))
(add-to-auto-mode-fn 'rhtml-mode '("\\.erb$" "\\.rhtml$"))

;;; Flymake
;; (defun flymake-ruby-init ()
;;   (let* ((temp-file (flymake-init-create-temp-buffer-copy 'flymake-create-temp-inplace))
;;          (local-file (file-relative-name temp-file (file-name-directory buffer-file-name))))
;;     (list "ruby" (list "-c" local-file))))
;; (push '(".+\\.rb$" flymake-ruby-init) flymake-allowed-file-name-masks)
;; (push '("Rakefile$" flymake-ruby-init) flymake-allowed-file-name-masks)
;; (push '("^\\(.*\\):\\([0-9]+\\): \\(.*\\)$" 1 2 nil 3) flymake-err-line-patterns)
