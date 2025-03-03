#lang racket

(define (pivot-array nums pivot)
  (let loop ((ns nums)
             (less-thans '())
             (equals '())
             (greater-thans '()))
    (cond ((empty? ns) (append (reverse less-thans)
                               equals
                               (reverse greater-thans)))
          ((< (car ns) pivot) (loop (cdr ns)
                                    (cons (car ns) less-thans)
                                    equals
                                    greater-thans))
          ((> (car ns) pivot) (loop (cdr ns)
                                    less-thans
                                    equals
                                    (cons (car ns) greater-thans)))
          (else (loop (cdr ns)
                      less-thans
                      (cons (car ns) equals)
                      greater-thans)))))

(pivot-array '(9 12 5 10 14 3 10) 10) ; => '(9 5 3 10 10 12 14)
