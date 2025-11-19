#lang racket

(define (find-final-value nums original)
  (if (member original nums)
      (find-final-value nums (* 2 original))
      original))

(find-final-value '(5 3 6 1 12) 3)
(find-final-value '(2 7 9) 4)
