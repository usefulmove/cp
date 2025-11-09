#lang racket

(define (count-operations num1 num2)
  (let loop ((a num1) (b num2) (ops 0))
    (cond ((or (zero? a) (zero? b)) ops)
          ((>= a b) (loop (- a b) b (+ ops 1)))
          (else (loop a (- b a) (+ ops 1))))))

(count-operations 2 3) ; => 3
(count-operations 10 10) ; => 1
