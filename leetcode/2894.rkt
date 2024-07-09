#lang racket

(define/contract (difference-of-sums n m)
  (-> exact-integer? exact-integer? exact-integer?)
  (foldl
   (lambda (a acc)
     (+ acc
        (if (= 0 (modulo a m))
            (- a)
            a)))
   0
   (range 1 (+ 1 n))))
