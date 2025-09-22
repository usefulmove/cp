#lang racket

(define (even-number-bitwise-o-rs nums)
  (foldl
   (lambda (n bor)
     (if (even? n)
         (bitwise-ior bor n)
         bor))
   0
   nums))

#;(define (even-number-bitwise-o-rs nums)
  (let loop ((ns nums) (bor 0))
    (cond ((empty? ns) bor)
          ((even? (car ns)) (loop (cdr ns) (bitwise-ior bor (car ns))))
          (else (loop (cdr ns) bor)))))

#;(define (even-number-bitwise-o-rs nums)
  (apply bitwise-ior (filter even? nums)))

(even-number-bitwise-o-rs '(1 2 3 4 5 6)) ; => 6
(even-number-bitwise-o-rs '(7 9 11)) ; => 0
(even-number-bitwise-o-rs '(1 8 16)) ; => 24
