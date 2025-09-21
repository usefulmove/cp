#lang racket

(define (kth-character k)
  (let ((next (lambda (lst)
                (map
                 (lambda (o)
                   (remainder (+ o 1) 26))
                 lst))))
    (let loop ((cs '(1)))
      (if (>= (length cs) k)
          (integer->char (+ 96 (list-ref cs (- k 1))))
          (loop (append cs (next cs)))))))

(kth-character 5) ; => #\b
(kth-character 10) ; => #\c
