#lang racket


(define (smaller-numbers-than-current nums)
  (map
   (lambda (current-value)
     (count
      (lambda (test-value)
        (< test-value current-value))
      nums))
   nums))


(smaller-numbers-than-current '(8 1 2 2 3))
(smaller-numbers-than-current '(6 5 4 8))
(smaller-numbers-than-current '(7 7 7 7))
