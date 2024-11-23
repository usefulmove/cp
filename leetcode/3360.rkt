#lang racket

(define (call-alice-win n)
  (let loop ((num n)
             (stones-to-remove 10)
             (is-alices-turn #t))
    (if (>= num stones-to-remove)
        (loop (- num stones-to-remove)
              (- stones-to-remove 1)
              (not is-alices-turn))
        (not is-alices-turn))))

(call-alice-win 12)
(call-alice-win 1)
(call-alice-win 19)
