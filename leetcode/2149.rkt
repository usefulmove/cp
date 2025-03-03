#lang racket

(define (rearrange-array nums)
  (let-values (((positives negatives)
                (partition positive? nums)))
    (foldr
     (lambda (pos neg acc)
       (append (list pos neg) acc))
     '()
     positives
     negatives)))

#;(define (rearrange-array nums)
  (let loop ((ns nums)
             (pos-sign #t)
             (negs '())
             (poss '())
             (output '()))
    (cond ((and (empty? ns)
                (empty? negs)
                (empty? poss)) (reverse output))
          ((and pos-sign
                (not (empty? poss))) (loop ns
                                           (not pos-sign)
                                           negs
                                           (take poss (- (length poss) 1))
                                           (cons (last poss) output)))
          ((and pos-sign
                (not (empty? ns))) (if (positive? (car ns))
                                       (loop (cdr ns)
                                             (not pos-sign)
                                             negs
                                             poss
                                             (cons (car ns) output))
                                       (loop (cdr ns)
                                             pos-sign
                                             (cons (car ns) negs)
                                             poss
                                             output)))
          ((not (empty? negs)) (loop ns
                                     (not pos-sign)
                                     (take negs (- (length negs) 1))
                                     poss
                                     (cons (last negs) output)))
          ((not (empty? ns)) (if (negative? (car ns))
                                 (loop (cdr ns)
                                       (not pos-sign)
                                       negs
                                       poss
                                       (cons (car ns) output))
                                 (loop (cdr ns)
                                       pos-sign
                                       negs
                                       (cons (car ns) poss)
                                       output))))))

(rearrange-array '(3 1 -2 -5 2 -4)) ; => '(3 -2 1 -5 2 -4)
(rearrange-array '(-1 1)) ; => '(1 -1)
