(defun egg-count (number)
  (reduce #'+ 
          (format nil "~B" number)
          :initial-value 0
          :key #'(lambda (c)
                   (if (char= c #\1) 1 0))))
