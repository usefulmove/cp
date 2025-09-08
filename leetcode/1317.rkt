#lang racket

(define (get-no-zero-integers n)
  (let ((no-zero? (lambda (n)
                    (let loop ((num n))
                      (cond ((zero? num) #t)
                            ((zero? (remainder num 10)) #f)
                            (else (loop (quotient num 10))))))))
    (let loop ((a 1))
      (if (and (no-zero? a)
               (no-zero? (- n a)))
          (list a (- n a))
          (loop (add1 a))))))

(get-no-zero-integers 2)
(get-no-zero-integers 11)
