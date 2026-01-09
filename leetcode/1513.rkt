#lang racket

#|
Uses [triangular numbers](https://en.wikipedia.org/wiki/Triangular_number) on the lengths of contiguous ones to accumulate the total number of substrings.
 |#


(define/contract (num-sub s)
  (-> string? exact-integer?)
  (let ((contiguous-ones (map string-length (string-split s "0")))
        (triangular (lambda (a) (/ (* a (+ a 1)) 2))))
    (foldl
     (lambda (ones count)
       (modulo (+ count (triangular ones)) 1000000007))
     0
     contiguous-ones)))


(num-sub "0110111") ; => 9
(num-sub "101")     ; => 2
(num-sub "111111")  ; => 21
