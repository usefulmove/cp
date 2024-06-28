#lang racket

(define (single-number nums)
  (foldl
   (lambda (n acc)
     (if (member n acc)
         (remove n acc)
         (cons n acc)))
   '()
   nums))

(single-number '(1 2 1 3 2 5))
(single-number '(-1 0))
(single-number '(0 1))
