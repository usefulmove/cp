#lang racket

(define (kth-distinct arr k)
  (letrec ((get-distincts (lambda (lst)
                            (if (null? lst)
                                '()
                                (let ((first (car lst))
                                      (rest (cdr lst)))
                                  (if (member first rest)
                                      (get-distincts (filter
                                                      (lambda (e) (not (equal? e first)))
                                                      rest))
                                      (cons first (get-distincts rest)))))))
           (distincts (get-distincts arr)))
    (if (> k (length distincts))
        ""
        (list-ref distincts (- k 1)))))
