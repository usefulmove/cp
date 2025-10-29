#lang racket

(define (smallest-number n)
  (string->number
   (make-string
    (string-length (number->string n 2))
    #\1)
   2))

(smallest-number 5)
(smallest-number 10)
(smallest-number 3) ; => 3
