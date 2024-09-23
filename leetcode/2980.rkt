#lang racket

(define (has-trailing-zeros nums)
  (let ((set-low-bits (foldl
                       (lambda (num acc)
                         (+ acc (bitwise-and num 1)))
                       0
                       nums)))
    (> (- (length nums)
          set-low-bits)
       1)))

(has-trailing-zeros '(1 2 3 4 5))
(has-trailing-zeros '(2 4 8 16))
(has-trailing-zeros '(1 3 5 7 9))
