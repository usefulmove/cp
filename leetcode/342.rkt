#lang racket

(define (is-power-of-four n)
  (if (<= n 0)
      #f
      (< (abs (- (log n 4)
                 (round (log n 4))))
         0.0000000000001)))

(is-power-of-four 16) ; => #t
(is-power-of-four 5) ; => #f
(is-power-of-four 1) ; => #t
