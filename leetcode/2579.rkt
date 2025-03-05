#lang racket

(define/contract (colored-cells n)
  (-> exact-integer? exact-integer?)
  (+ (* 2 n (- n 1)) 
     1))
