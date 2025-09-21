#lang racket

(define (even-number-bitwise-o-rs nums)
  (let loop ((ns nums) (bor 0))
    (cond ((empty? ns) bor)
          ((even? (car ns)) (loop (cdr ns) (bitwise-ior bor (car ns))))
          (else (loop (cdr ns) bor)))))

(define (even-number-bitwise-o-rs nums)
  (apply bitwise-ior (filter even? nums)))
