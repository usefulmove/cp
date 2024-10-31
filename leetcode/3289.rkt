#lang racket

(define (get-sneaky-numbers nums)
  (car (foldl
        (lambda (num acc)
          (let ((out (car acc))
                (seen (cdr acc)))
            (if (member num seen)
                (cons (cons num out) seen)
                (cons out (cons num seen)))))
        '(() . ()) ; (out . seen)
        nums)))
