#lang racket

(define (is-power-of-four n)
  (and (> n 0)
       (< (abs (- (log n 4)
                  (round (log n 4))))
          1e-13)))

(is-power-of-four 16) ; => #t
(is-power-of-four 5) ; => #f
(is-power-of-four 1) ; => #t
