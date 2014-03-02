(eval-when-compile
  (require 'cl)
  (require 'cc-mode))

(defun php-docblock/line-string (&optional shift)
  (save-excursion
    (when shift
      (forward-line shift))
    (beginning-of-line)
    (let ((start (point)))
      (end-of-line)
      (buffer-substring start (point)))))

(defun php-docblock/current-line-string ()
  (php-docblock/line-string))

(defun php-docblock/prev-line-string ()
  (php-docblock/line-string -1))

(defun php-docblock/next-line-string ()
  (php-docblock/line-string 1))

(defun php-docblock/next-line-string-regexp (regexp)
  (let ((str (php-docblock/next-line-string)))
    (when (string-match regexp str)
      (match-string 1 str))))

(defun php-docblock/inside-comment-p ()
  (and (eq (get-text-property (point) 'face) 'font-lock-comment-face)
       (string-match "^\\s-*/?\\*" (php-docblock/current-line-string))))

(defun php-docblock/beginning-block-p ()
  (string-match
   "^\\s-*/\\*\\*"
   (php-docblock/current-line-string)))

(defun php-docblock/beginning-function-p ()
  (string-match
   "\\s-*\\(?:abstract\\|final\\|private\\|protected\\|public\\|static\\)?\\s-+function"
   (php-docblock/next-line-string)))

(defun php-docblock/beginning-class-p ()
  (string-match
   "\\s-*class\\s-+"
   (php-docblock/next-line-string)))

(defun php-docblock/beginning-variable-p ()
  (string-match
   "\\(?:var\\|private\\|protected\\|public\\|static\\)?\\s-*\\$[[:word:]_]+"
   (php-docblock/next-line-string)))

(defun php-docblock/new-line (&optional line)
  (newline)
  (insert (if line
              (concat "* " line)
            "*"))
  (c-indent-line-or-region))

(defun php-docblock/end-line ()
  (newline)
  (insert "*/")
  (c-indent-line-or-region))

(defun php-docblock/insert-tag (tag-name &optional params)
  (cond ((and (listp params) (> (length params) 0))
         (loop for param in params
               do (php-docblock/new-line (format "@%s %s" tag-name param))))
        ((stringp params)
         (php-docblock/new-line (format "@%s %s" tag-name params)))
        (t
         (php-docblock/new-line (format "@%s" tag-name)))))

(defun php-docblock/class-name ()
  (php-docblock/next-line-string-regexp
   "\\s-*class\\s-+\\([[:word:]_]+\\)"))

(defun php-docblock/valibale-name ()
  (php-docblock/next-line-string-regexp
   "\\($[[:word:]_]+\\)"))

(defun php-docblock/function-args ()
  (let ((args (php-docblock/next-line-string-regexp
               "function\\s-+\\(?:[[:word:]_]+\\)\\s-*(\\([^)]*\\))")))
    (when (> (length args) 0)
      (split-string args "\\(\\s-*=\\s-*\\)?,\\s-?"))))

(defun php-docblock/gen-class ()
  (php-docblock/new-line "class description...")
  (php-docblock/new-line)
  (php-docblock/insert-tag "package" (php-docblock/class-name))
  (php-docblock/insert-tag "author"  (user-full-name))
  (php-docblock/insert-tag "version" "0.0.1"))

(defun php-docblock/gen-function ()
  (php-docblock/new-line "function description...")
  (php-docblock/new-line)
  (let ((params (php-docblock/function-args)))
    (and params (php-docblock/insert-tag "param" params)))
  (php-docblock/insert-tag "return"))

(defun php-docblock/gen-variable ()
  (php-docblock/new-line "variable description...")
  (php-docblock/new-line)
  (php-docblock/insert-tag "var" (php-docblock/valibale-name)))

(defun php-docblock/gen-block (block-func)
  (save-excursion
    (funcall block-func)
    (php-docblock/end-line)))
;;  (forward-line 1))

(defun php-docblock/generate ()
  (cond ((php-docblock/beginning-class-p)
         (php-docblock/gen-block #'php-docblock/gen-class))
        ((php-docblock/beginning-function-p)
         (php-docblock/gen-block #'php-docblock/gen-function))
        ((php-docblock/beginning-variable-p)
         (php-docblock/gen-block #'php-docblock/gen-variable))
        (t
         (php-docblock/new-line))))

(defun php-docblock/newline-and-indent ()
  (interactive)
  (if (php-docblock/inside-comment-p)
      (php-docblock/generate)
    (newline-and-indent)))

(provide 'php-docblock)
