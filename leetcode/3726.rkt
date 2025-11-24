#lang racket

(define/contract (remove-zeros n)
  (-> exact-integer? exact-integer?)
  (string->number
   (string-replace (number->string n) "0" "")))
