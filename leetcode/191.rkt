(define (hamming-weight n (cnt 0))
  (if (zero? n)
      cnt
      (hamming-weight
       (arithmetic-shift n -1)
       (+ cnt (bitwise-and n 1)))))
