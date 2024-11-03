#lang racket

(define (rotate-string s goal)
  (letrec ((chars (string->list s))
           (goal-chars (string->list goal))
           (len (length chars))
           (rotate (lambda (lst)
                     (append (cdr lst)
                             (list (car lst)))))
           (rotate-chars (lambda (cs gs n)
                           (cond ((= n len) #f)
                                 ((equal? cs gs) #t)
                                 (else (rotate-chars (rotate cs) gs (+ 1 n)))))))
    (rotate-chars chars goal-chars 0)))
