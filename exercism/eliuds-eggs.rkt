#lang racket

(define (number->eggs n)
  (count
   (lambda (c)
     (equal? c #\1))
   (string->list (number->string n 2))))
