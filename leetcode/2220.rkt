#lang racket

(define (min-bit-flips start goal)
  (foldl
   (lambda (a acc) (+ acc (if (equal? #\1 a) 1 0)))
   0
   (string->list (number->string (bitwise-xor start goal) 2))))

(min-bit-flips 10 7)
