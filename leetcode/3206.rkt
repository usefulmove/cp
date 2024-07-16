#lang racket

(define (any? f lst)
  (cond ((null? lst) #f)
        ((f (car lst)) #t)
        (else (any? f (cdr lst)))))

(define (zip . lsts)
  (cond ((null? lsts) '())
        ((any? identity (map null? lsts)) '())
        (else (cons (map car lsts)
                    (apply zip (map cdr lsts)))))) 

(define (number-of-alternating-groups colors)
  (let* ((extended-colors (append colors
                                  (take colors 2)))
         (groups (zip extended-colors
                      (cdr extended-colors)
                      (cddr extended-colors))))
    (count
     (lambda (group)
       (let ((a (car group))
             (b (cadr group))
             (c (caddr group)))
         (and (= a c)
              (not (= a b)))))
     groups)))

(number-of-alternating-groups '(0 1 0 0 1))
