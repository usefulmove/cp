#lang racket

(define (maximum-beauty items queries)
  (map
   (lambda (query)
     (apply max (map
                 (lambda (item)
                   (let ((price (first item))
                         (beauty (second item)))
                     (if (<= price query)
                         beauty
                         0)))
                 items)))
   queries))
