#lang racket

(define (is-power-of-three n)
  (if (<= n 0)
      #f
      (< (abs (- (log n 3)
                 (round (log n 3))))
         0.000000000001)))

(is-power-of-three 27)
(is-power-of-three 0)
(is-power-of-three -1)
