#lang racket

(define (has-trailing-zeros nums)
  (let ((unset-low-bits (foldl
                         (lambda (num acc)
                           (+ acc
                              (if (zero? (bitwise-and num 1))
                                  1
                                  0)))
                         0
                         nums)))
    (> unset-low-bits 1)))

(has-trailing-zeros '(1 2 3 4 5))
(has-trailing-zeros '(2 4 8 16))
(has-trailing-zeros '(1 3 5 7 9))
