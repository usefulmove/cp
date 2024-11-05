(defun int-to-binary (n)
  (if (<= n 0)
      "0"
    (let ((result ""))
      (while (> n 0)
        (setq result (concat (number-to-string (% n 2)) result)
              n (/ n 2)))
      result)))

(defun egg-count (number)
  (seq-reduce
   (lambda (acc c)
     (+ acc (if (equal c ?1) 1 0)))
   (int-to-binary number)
   0))
