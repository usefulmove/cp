#lang racket

(define (get-sneaky-numbers nums)
  (let loop ((lst nums)
             (result '())
             (seen '()))
    (cond ((empty? lst) result)
          ((member (car lst) seen) (loop (cdr lst)
                                         (cons (car lst) result)
                                         seen))
          (else (loop (cdr lst)
                      result
                      (cons (car lst) seen))))))

(define (get-sneaky-numbers nums)
  (car (foldl
        (lambda (num acc)
          (let ((result (car acc))
                (seen (cdr acc)))
            (if (member num seen) ; if seen previously ...
                (cons (cons num result) seen) ; add to result
                (cons result (cons num seen))))) ; otherwise, add to seen
        '(() . ()) ; (result . seen)
        nums)))
