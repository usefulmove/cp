#lang racket


(define (modular-expt base exponent modulus)
  (if (= exponent 0)
      1
      (let ((temp (modular-expt base (quotient exponent 2) modulus)))
        (modulo (* temp temp (if (odd? exponent) base 1)) modulus))))


(define (count-good-numbers n)
  (let* ((modulus (+ 7 (expt 10 9)))
         (num-odd (quotient n 2))
         (num-even (if (even? n) num-odd (add1 num-odd))))
    (modulo (* (modular-expt 5 num-even modulus)
               (modular-expt 4 num-odd modulus)) modulus)))


(count-good-numbers 1)
(count-good-numbers 4)
(count-good-numbers 50)
