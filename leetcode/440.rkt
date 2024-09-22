#lang racket

(define (find-kth-number n k)
  (let ((ordered-pairs (sort
                        (map
                         (lambda (n) (cons n (number->string n)))
                         (range 1 (+ n 1)))
                        (lambda (pair-a pair-b)
                          (string<? (cdr pair-a) (cdr pair-b))))))
    (car
     (list-ref ordered-pairs (- k 1)))))

(find-kth-number 13 2)
(find-kth-number 1 1)
