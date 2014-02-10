(defmacro add-to-auto-mode-fn (func body)
  (declare (indent defun))
  `(dolist (b ,body)
     (add-to-list 'auto-mode-alist (cons b ,func))))

(defun add-auto-mode (mode &rest patterns)
  "Add entries to `auto-mode-alist' to use `MODE' for all given file `PATTERNS'."
  (dolist (pattern patterns)
    (add-to-list 'auto-mode-alist (cons pattern mode))))

(defmacro add-hook-fn (name &rest body)
  (declare (indent defun))
  `(add-hook ,name #'(lambda () ,@body)))

(defmacro lazyload (func lib &rest body)
  (declare (indent defun))
  `(when (locate-library ,lib)
     ,@(mapcar (lambda (f) `(autoload ',f ,lib nil t)) func)
     (eval-after-load ,lib '(progn ,@body))))

(defmacro after-load (feature &rest body)
  "After FEATURE is loaded, evaluate BODY."
  (declare (indent defun))
  `(eval-after-load ,feature
     '(progn ,@body)))

(provide 'init-utils)