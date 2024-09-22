#lang racket

(define (lexical-order n)
  (map car (sort
            (map
             (lambda (n) (cons n (number->string n)))
             (range 1 (+ n 1)))
            (lambda (pair-a pair-b)
              (string<? (cdr pair-a) (cdr pair-b))))))

(lexical-order 13)
(lexical-order 2)
