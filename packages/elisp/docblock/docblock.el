(eval-when-compile
  (require 'cl)
  (require 'cc-mode))

(defun docblock/line-string (&optional shift)
  (save-excursion
    (when shift
      (forward-line shift))
    (beginning-of-line)
    (let ((start (point)))
      (end-of-line)
      (buffer-substring start (point)))))

(defun docblock/current-line-string ()
  (docblock/line-string))

(defun docblock/prev-line-string ()
  (docblock/line-string -1))

(defun docblock/next-line-string ()
  (docblock/line-string 1))

(defun docblock/next-line-string-regexp (regexp)
  (let ((str (docblock/next-line-string)))
    (when (string-match regexp str)
      (match-string 1 str))))

(defun docblock/inside-comment-p ()
  (and (eq (get-text-property (point) 'face) 'font-lock-comment-face)
       (string-match "^\\s-*/?\\*" (docblock/current-line-string))))

(defun docblock/beginning-block-p ()
  (string-match
   "^\\s-*/\\*\\*"
   (docblock/current-line-string)))

(defun docblock/beginning-function-p ()
  (string-match
   "\\s-*\\(?:abstract\\|final\\|private\\|protected\\|public\\|static\\)?\\s-+function"
   (docblock/next-line-string)))

(defun docblock/beginning-class-p ()
  (string-match
   "\\s-*class\\s-+"
   (docblock/next-line-string)))

(defun docblock/beginning-variable-p ()
  (string-match
   "\\(?:var\\|private\\|protected\\|public\\|static\\)?\\s-*\\$[[:word:]_]+"
   (docblock/next-line-string)))

(defun docblock/new-line (&optional line)
  (newline)
  (insert (if line
              (concat "* " line)
            "*"))
  (c-indent-line-or-region))

(defun docblock/end-line ()
  (newline)
  (insert "*/")
  (c-indent-line-or-region))

(defun docblock/insert-tag (tag-name &optional params)
  (cond ((and (listp params) (> (length params) 0))
         (loop for param in params
               do (docblock/new-line (format "@%s %s" tag-name param))))
        ((stringp params)
         (docblock/new-line (format "@%s %s" tag-name params)))
        (t
         (docblock/new-line (format "@%s" tag-name)))))

(defun docblock/class-name ()
  (docblock/next-line-string-regexp
   "\\s-*class\\s-+\\([[:word:]_]+\\)"))

(defun docblock/valibale-name ()
  (docblock/next-line-string-regexp
   "\\($[[:word:]_]+\\)"))

(defun docblock/function-args ()
  (let ((args (docblock/next-line-string-regexp
               "function\\s-+\\(?:[[:word:]_]+\\)\\s-*(\\([^)]*\\))")))
    (when (> (length args) 0)
      (split-string args "\\(\\s-*=\\s-*\\)?,\\s-?"))))

(defun docblock/gen-class ()
  (docblock/new-line "class description...")
  (docblock/new-line)
  (docblock/insert-tag "package" (docblock/class-name))
  (docblock/insert-tag "author"  (user-full-name))
  (docblock/insert-tag "version" "0.0.1"))

(defun docblock/gen-function ()
  (docblock/new-line "function description...")
  (docblock/new-line)
  (let ((params (docblock/function-args)))
    (and params (docblock/insert-tag "param" params)))
  (docblock/insert-tag "return"))

(defun docblock/gen-variable ()
  (docblock/new-line "variable description...")
  (docblock/new-line)
  (docblock/insert-tag "var" (docblock/valibale-name)))

(defun docblock/gen-block (block-func)
  (save-excursion
    (funcall block-func)
    (docblock/end-line)))
;;  (forward-line 1))

(defun docblock/generate ()
  (cond ((docblock/beginning-class-p)
         (docblock/gen-block #'docblock/gen-class))
        ((docblock/beginning-function-p)
         (docblock/gen-block #'docblock/gen-function))
        ((docblock/beginning-variable-p)
         (docblock/gen-block #'docblock/gen-variable))
        (t
         (docblock/new-line))))

(defun docblock/newline-and-indent ()
  (interactive)
  (if (docblock/inside-comment-p)
      (docblock/generate)
    (newline-and-indent)))

(provide 'docblock)
