(defun two-fer (&optional name)
  (format
   "One for %s, one for me."
   (if (null name) "you" name)))
