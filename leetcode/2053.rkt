#lang racket

(define (kth-distinct arr k)
  (letrec ((get-distincts (lambda (lst)
                            (if (null? lst)
                                '()
                                (if (not (member ; if car is not duplicated in rest of list (if distinct)
                                          (car lst)
                                          (cdr lst)))
                                    (cons (car lst)
                                          (get-distincts (cdr lst)))
                                    (get-distincts (filter
                                                    (lambda (e)
                                                      (not (equal? e (car lst))))
                                                    (cdr lst)))))))
           (distincts (get-distincts arr)))
    (if (> k (length distincts))
        ""
        (list-ref distincts (- k 1)))))
