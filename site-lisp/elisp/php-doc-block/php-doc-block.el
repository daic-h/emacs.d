(eval-when-compile
  (require 'cl)
  (require 'cc-mode))

(defun php-doc-block/line-string (&optional shift)
  (save-excursion
    (when shift
      (forward-line shift))
    (beginning-of-line)
    (let ((start (point)))
      (end-of-line)
      (buffer-substring start (point)))))

(defun php-doc-block/current-line-string ()
  (php-doc-block/line-string))

(defun php-doc-block/prev-line-string ()
  (php-doc-block/line-string -1))

(defun php-doc-block/next-line-string ()
  (php-doc-block/line-string 1))

(defun php-doc-block/next-line-string-regexp (regexp)
  (let ((str (php-doc-block/next-line-string)))
    (when (string-match regexp str)
      (match-string 1 str))))

(defun php-doc-block/inside-comment-p ()
  (and (eq (get-text-property (point) 'face) 'font-lock-comment-face)
       (string-match "^\\s-*/?\\*" (php-doc-block/current-line-string))))

(defun php-doc-block/beginning-block-p ()
  (string-match
   "^\\s-*/\\*\\*"
   (php-doc-block/current-line-string)))

(defun php-doc-block/beginning-function-p ()
  (string-match
   "\\s-*\\(?:abstract\\|final\\|private\\|protected\\|public\\|static\\)?\\s-+function"
   (php-doc-block/next-line-string)))

(defun php-doc-block/beginning-class-p ()
  (string-match
   "\\s-*class\\s-+"
   (php-doc-block/next-line-string)))

(defun php-doc-block/beginning-variable-p ()
  (string-match
   "\\(?:var\\|private\\|protected\\|public\\|static\\)?\\s-*\\$[[:word:]_]+"
   (php-doc-block/next-line-string)))

(defun php-doc-block/new-line (&optional line)
  (newline)
  (insert (if line
              (concat "* " line)
            "*"))
  (c-indent-line-or-region))

(defun php-doc-block/end-line ()
  (newline)
  (insert "*/")
  (c-indent-line-or-region))

(defun php-doc-block/insert-tag (tag-name &optional params)
  (cond ((and (listp params) (> (length params) 0))
         (loop for param in params
               do (php-doc-block/new-line (format "@%s %s" tag-name param))))
        ((stringp params)
         (php-doc-block/new-line (format "@%s %s" tag-name params)))
        (t
         (php-doc-block/new-line (format "@%s" tag-name)))))

(defun php-doc-block/class-name ()
  (php-doc-block/next-line-string-regexp
   "\\s-*class\\s-+\\([[:word:]_]+\\)"))

(defun php-doc-block/valibale-name ()
  (php-doc-block/next-line-string-regexp
   "\\($[[:word:]_]+\\)"))

(defun php-doc-block/function-args ()
  (let ((args (php-doc-block/next-line-string-regexp
               "function\\s-+\\(?:[[:word:]_]+\\)\\s-*(\\([^)]*\\))")))
    (when (> (length args) 0)
      (split-string args "\\(\\s-*=\\s-*\\)?,\\s-?"))))

(defun php-doc-block/gen-class ()
  (php-doc-block/new-line "class description...")
  (php-doc-block/new-line)
  (php-doc-block/insert-tag "package" (php-doc-block/class-name))
  (php-doc-block/insert-tag "author"  (user-full-name))
  (php-doc-block/insert-tag "version" "0.0.1"))

(defun php-doc-block/gen-function ()
  (php-doc-block/new-line "function description...")
  (php-doc-block/new-line)
  (let ((params (php-doc-block/function-args)))
    (and params (php-doc-block/insert-tag "param" params)))
  (php-doc-block/insert-tag "return"))

(defun php-doc-block/gen-variable ()
  (php-doc-block/new-line "variable description...")
  (php-doc-block/new-line)
  (php-doc-block/insert-tag "var" (php-doc-block/valibale-name)))

(defun php-doc-block/gen-block (block-func)
  (save-excursion
    (funcall block-func)
    (php-doc-block/end-line)))
;;  (forward-line 1))

(defun php-doc-block/generate ()
  (cond ((php-doc-block/beginning-class-p)
         (php-doc-block/gen-block #'php-doc-block/gen-class))
        ((php-doc-block/beginning-function-p)
         (php-doc-block/gen-block #'php-doc-block/gen-function))
        ((php-doc-block/beginning-variable-p)
         (php-doc-block/gen-block #'php-doc-block/gen-variable))
        (t
         (php-doc-block/new-line))))

(defun php-doc-block/newline-and-indent ()
  (interactive)
  (if (php-doc-block/inside-comment-p)
      (php-doc-block/generate)
    (newline-and-indent)))

(provide 'php-doc-block)
