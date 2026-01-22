#lang racket

(define (tribonacci n (a 0) (b 1) (c 1))
  (cond ((= n 0) a)
        ((= n 1) b)
        ((= n 2) c)
        (else (tribonacci (- n 1) b c (+ a b c)))))
