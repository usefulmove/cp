#lang racket

(provide my-length
         my-reverse
         my-map
         my-filter
         my-fold
         my-append
         my-concatenate)

(define (my-length sequence (acc 0))
  (cond ((null? sequence) acc)
        (else (my-length (cdr sequence) (add1 acc)))))

(define (my-reverse sequence)
  (my-fold
   (lambda (a acc) (cons a acc))
   '()
   sequence))

(define (my-map operation sequence)
  (my-fold
   (lambda (a acc)
     (cons (operation a) acc))
   '()
   (my-reverse sequence)))

(define (my-filter operation? sequence)
  (my-fold
   (lambda (a acc) (if (operation? a)
                       (cons a acc) ; keep element
                       acc)) ; discard element
   '()
   (my-reverse sequence)))

(define (my-fold operation accumulator sequence)
  (cond ((null? sequence) accumulator)
        (else (my-fold
               operation
               (operation (car sequence) accumulator)
               (cdr sequence)))))

(define (my-append sequence1 sequence2)
  (my-fold
   (lambda (a acc) (cons a acc))
   sequence2
   (my-reverse sequence1)))

(define (my-concatenate sequence-of-sequences)
  (my-fold
   (lambda (lst acc) (my-append acc lst))
   '()
   sequence-of-sequences))

(my-length '())
(my-length '(3 1 2 0 5 4))
(my-reverse '())
(my-reverse '(3 1 2 0 5 4))
(my-map identity '())
(my-map identity '(3 1 2))
(my-map (lambda (a) (* a a)) '(3 1 2))
(my-filter odd? '())
(my-filter odd? '(3 1 2 0 5 4))
(my-filter even? '(3 1 2 0 5 4))
(my-append '() '())
(my-append '(3 1 2) '())
(my-append '() '(3 1 2))
(my-append '(3 1 2) '(0 5 4))
(my-fold + 618 '())
(my-fold + 0 '(3 1 2 0 5 4))
(my-fold (lambda (a acc) (+ acc (* a a))) 0 (range (add1 8)))
(my-concatenate '((3 1 2) () (0) (5 4)))
(my-concatenate '((3 1 2 0 5 4)))
(my-concatenate '((3 1 2) ((0)) (5 4)))
