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


(define (sort-people names heights)
  (map car (sort
            (zip names heights)
            (lambda (a b)
              (> (cadr a) (cadr b))))))


(sort-people '("mary" "john" "emma") '(180 165 170))
(sort-people '("alice" "bob" "bob") '(155 185 150))
