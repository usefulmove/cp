(define (hamming-weight n (ones 0))
  (if (zero? n)
      ones
      (hamming-weight
       (arithmetic-shift n -1)
       (+ ones (bitwise-and n 1)))))
