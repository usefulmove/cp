#lang racket

(define (min-operations nums k)
  (remainder (apply + nums) k))

(min-operations '(3 9 7) 5) ; => 4
(min-operations '(4 1 3) 4) ; => 0
(min-operations '(3 2) 6) ; => 5
