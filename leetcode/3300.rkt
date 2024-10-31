#lang racket

(define (min-element nums)
  (letrec ((sum-digits (lambda (n)
                         (if (< n 10)
                             n
                             (let ((rem (remainder n 10)))
                               (+ rem
                                  (sum-digits (quotient (- n rem) 10)))))))
        (digit-sums (map sum-digits nums)))
    (apply min digit-sums)))
