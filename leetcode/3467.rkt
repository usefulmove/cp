#lang racket

(define (transform-array nums)
  (let ((evens (count even? nums)))
    (append (make-list evens 0)
            (make-list (- (length nums) evens) 1))))

(transform-array '(4 3 2 1))
