#lang racket

(define (min-bitwise-array nums)
  (let ((find-index-solution
          (lambda (n)
            (if (even? n)
                -1
                (let loop ((o 0))
                  (cond ((= o n) -1)
                        ((= n (bitwise-ior o (+ o 1))) o)
                        (else (loop (+ o 1)))))))))
    (map find-index-solution nums)))

(min-bitwise-array '(2 3 5 7))  ; '(-1 1 4 3)
(min-bitwise-array '(11 13 31)) ; '(9 12 15)
