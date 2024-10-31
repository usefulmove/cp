#lang racket

(define (find-permutation-difference s t)
  (let ((s-chars (string->list s))
        (t-chars (string->list t)))
    (foldl
     (lambda (c acc)
       (+ acc
          (abs (- (index-of s-chars c)
                  (index-of t-chars c)))))
     0
     s-chars)))
