#lang racket

(define (gcd-of-odd-even-sums n) n)

#;(define (gcd-of-odd-even-sums n)
  (letrec ((gcd (lambda (a b)
                  (if (zero? b)
                      a
                      (gcd b (remainder a b))))))
    (gcd (* n n)
         (* n (add1 n)))))

(gcd-of-odd-even-sums 4) ; => 4
(gcd-of-odd-even-sums 5) ; => 5
(gcd-of-odd-even-sums 29) ; => 29
