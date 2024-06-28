#lang racket

(define (num-steps s)
  (letrec ((n (string->number s 2))
           (reduce (lambda (x steps)
                     (cond ((= 1 x) steps)
                           ((even? x) (reduce (/ x 2) (+ 1 steps)))
                           (else (reduce (+ 1 x) (+ 1 steps)))))))
    (reduce n 0)))

(num-steps "1101")
(num-steps "10")
(num-steps "1")
