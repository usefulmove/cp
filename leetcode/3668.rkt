#lang racket

(define (recover-order order friends)
  (filter
   (lambda (e) (member e friends))
   order))

(recover-order '(3 1 2 5 4) '(1 3 4)) ; => '(3 1 4)
(recover-order '(1 4 5 3 2) '(2 5)) ; => '(5 2)
