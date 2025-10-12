#lang racket

(define (alternate-digit-sum n)
  (let loop ((n n) (pol #t) (acc 0))
    (if (zero? n)
        (if pol (- acc) acc)
        (let ((quot (quotient n 10))
              (rem (remainder n 10)))
          (loop quot
                (not pol)
                (+ acc (if pol rem (- rem))))))))

#;(define (alternate-digit-sum n)
  (let loop ((n n) (pol #t) (cnt 0) (acc 0))
    (if (zero? n)
        (if (odd? cnt) acc (- acc))
        (let ((quot (quotient n 10))
              (rem (remainder n 10)))
          (loop quot
                (not pol)
                (+ cnt 1)
                (+ acc (if pol rem (- rem))))))))

(alternate-digit-sum 521) ; => 4
(alternate-digit-sum 111) ; => 1
(alternate-digit-sum 886996) ; => 0
