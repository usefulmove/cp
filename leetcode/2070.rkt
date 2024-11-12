#lang racket

(define (maximum-beauty items queries)
  (map
   (lambda (query)
     (apply max (filter-map
                 (lambda (item)
                   (let ((price (car item))
                         (beauty (cadr item)))
                     (if (<= price query)
                         beauty
                         0)))
                 items)))
   queries))
