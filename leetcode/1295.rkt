#lang racket

(define (find-numbers nums)
  (count
   (compose even? string-length number->string)
   nums))

(find-numbers '(12 345 2 6 7896)) ; => 2
(find-numbers '(555 901 482 1771)) ; => 1
