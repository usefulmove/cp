#lang racket

(define (is-palindrome x)
  (let ((lst (string->list (number->string x))))
    (equal? lst (reverse lst))))
