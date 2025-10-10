#lang racket

(define (alternating-sum nums)
  (let loop ((ns nums) (even #t) (out 0))
    (if (empty? ns)
        out
        (loop (cdr ns)
              (not even)
              (+ out (if even (car ns) (- (car ns))))))))

(alternating-sum '(1 3 5 7)) ; => -4
(alternating-sum '(100)) ; => 100
