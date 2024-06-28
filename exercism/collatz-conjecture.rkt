#lang racket

(provide collatz)

(define (collatz num)
  (cond ((or (< num 1)
             (not (integer? num))) (error 'collatz "input error"))
        ((= 1 num) 0)
        ((odd? num) (add1 (collatz (+ (* 3 num) 1))))
        ((even? num) (add1 (collatz (/ num 2))))))
