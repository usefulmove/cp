#lang racket

#|
Split the string to get only substrings containing continuous 1's. Use the triangular number formula (n(n+1)/2) and the length of each substring to determine the number of sub-substrings with all 1's. Sum all of the substring triangular number totals.

[triangular number](https://en.wikipedia.org/wiki/Triangular_number)
|#

(define (num-sub s)
  (let ((tng (lambda (n)
               (/ (* n (+ n 1)) 2))))
    (foldl
     (lambda (ones acc)
       (modulo
        (+ acc (tng (string-length ones)))
        1000000007))
     0
     (string-split s "0"))))

(num-sub "0110111") ; => 9
(num-sub "101")     ; => 2
(num-sub "111111")  ; => 21
