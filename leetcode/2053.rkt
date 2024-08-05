#lang racket

(define (kth-distinct arr k)
  (letrec ((keep-distincts (lambda (lst)
                             (cond ((null? lst) '())
                                   (else (let ((fst (car lst))
                                               (rst (cdr lst)))
                                           (if (member fst rst)
                                               (keep-distincts (filter-not
                                                                (lambda (e)
                                                                  (equal? e fst))
                                                                rst))
                                               (cons fst (keep-distincts rst))))))))
           (distincts (keep-distincts arr)))
    (if (> k (length distincts))
        ""
        (list-ref distincts (- k 1)))))
