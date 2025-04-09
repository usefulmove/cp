#lang racket

(define (min-operations nums k)
  (if (< (apply min nums) k)
      -1
      (length (remove k (remove-duplicates nums)))))

(min-operations '(5 2 5 4 5) 2)
(min-operations '(2 1 2) 2)
(min-operations '(9 7 5 3) 1)
