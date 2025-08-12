#lang racket

(define (reverse-degree s)
  (let ((value (lambda (c)
                       (- 123 (char->integer c)))))
    (let recur ((cs (string->list s))
                (ind 1)
                (degree 0))
      (if (empty? cs)
          degree
          (recur (cdr cs)
                 (+ ind 1)
                 (+ degree (* ind (value (car cs)))))))))

(reverse-degree "abc")
(reverse-degree "zaza")
