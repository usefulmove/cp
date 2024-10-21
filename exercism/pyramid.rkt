#lang racket

(define (pyramid n)
  (cond ((zero? n) empty)
        ((= 1 n) (list (list 1)))
        (else (append (pyramid (sub1 n))
                       (list (make-list n 1))))))

(pyramid 0)
(pyramid 1)
(pyramid 2)
(pyramid 3)
