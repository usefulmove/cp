#lang racket

; Count numbers that are not divisible by 3. ( Each can be made divisible by 3
; by adding or subtracting 1. )
(define (minimum-operations nums)
  (count
   (lambda (num)
     (not (= 0 (modulo num 3))))
   nums))
