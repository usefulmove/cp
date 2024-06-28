#lang racket

(define (keep lst predicate)
  (cond ((null? lst) '())
        ((predicate (car lst)) (cons (car lst)
                                     (keep (cdr lst) predicate)))
        (else (keep (cdr lst) predicate))))

(define (discard lst predicate)
  (keep lst (compose not predicate)))

(displayln (keep '(1 2 3 4 5) even?))
(displayln (discard '(1 2 3 4 5) even?))
