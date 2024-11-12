#lang racket


(define (maximum-beauty items queries)
  (map
   (lambda (query)
     (foldl
      (lambda (item acc-max-so-far)
        (max acc-max-so-far
             (if (<= (first item) query)
                 (second item)
                 0)))
      0
      items))
   queries))


(define (maximum-beauty items queries)
  (map
   (lambda (query)
     (foldl
      (lambda (item acc-max-so-far)
        (max acc-max-so-far
             (let ((price (first item))
                   (beauty (second item)))
               (if (<= price query)
                   beauty
                   0))))
      0
      items))
   queries))


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
