#lang racket

(define (kth-character k)
  (let ((calc-nexts (lambda (lst) (map
                                   (lambda (o) (remainder (+ o 1) 26))
                                   lst))))
    (let loop ((cs '(1))) ; a=1, b=2, ...
      (if (>= (length cs) k)
          (integer->char (+ 96 (list-ref cs (- k 1)))) ; return character
          (loop (append cs (calc-nexts cs)))))))

(kth-character 5) ; => #\b
(kth-character 10) ; => #\c
