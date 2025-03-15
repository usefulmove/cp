#lang racket

(define (rob nums)
  (cond ((empty? nums) 0)
        ((empty? (cdr nums)) (car nums))
        ((empty? (cddr nums)) (apply max nums))
        (else (max (+ (car nums) (rob (cddr nums)))
                   (+ (cadr nums) (rob (cdddr nums)))))))

(rob '(1 2 3 1)) ; => 4
(rob '(2 7 9 3 1)) ; => 12
