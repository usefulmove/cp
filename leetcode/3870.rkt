(define/contract (count-commas n)
  (-> exact-integer? exact-integer?)
  (if (< n 1000)
      0
      (- n 999)))
