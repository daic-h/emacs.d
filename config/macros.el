(defmacro add-to-auto-mode-fn (func body)
  `(dolist (b ,body)
     (add-to-list 'auto-mode-alist (cons b ,func))))

;;; http://e-arrows.sakura.ne.jp/2010/03/macros-in-emacs-el.html
(defmacro add-hook-fn (name &rest body)
  `(add-hook ,name #'(lambda () ,@body)))

;; (lazyload (triger-function ...) "filename" &rest body)
(defmacro lazyload (func lib &rest body)
  `(when (locate-library ,lib)
     ,@(mapcar (lambda (f) `(autoload ',f ,lib nil t)) func)
     (eval-after-load ,lib '(progn ,@body))))
