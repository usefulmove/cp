#lang racket

(define (special-array nums)
  (call-with-current-continuation
   (lambda (return)
     (for ((candidate (+ 1 (length nums))))
       (when (= candidate (count
                           (lambda (num) (>= num candidate))
                           nums))
         (return candidate)))
     -1)))

(special-array '(3 5))
(special-array '(0 0))
(special-array '(0 4 3 0 4))
