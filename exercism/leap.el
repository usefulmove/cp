(defun leap-year-p (year)
  (or (= 0 (mod year 400))
      (and (not (= 0 (mod year 100)))
           (= 0 (mod year 4)))))
