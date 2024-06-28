(defn leap-year? [year]
  (or (zero? (mod year 400))
      (and (not (zero? (mod year 100)))
           (zero? (mod year 4)))))
