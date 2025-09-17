#lang racket

(define (max-product n)
  (let ((digits (sort
                 (let loop ((num n)
                            (digs '()))
                   (if (zero? num)
                       digs
                       (loop (quotient num 10)
                             (cons (remainder num 10) digs))))
                 >)))
    (* (car digits)
       (cadr digits))))

(max-product 31) ; => 3
(max-product 22) ; => 4
(max-product 124) ; => 8
