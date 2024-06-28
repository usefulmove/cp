#lang racket

(provide armstrong-number?)

(define (armstrong-number? n)
  (let* ((char->digit (lambda (c) (- (char->integer c)
                                     (char->integer #\0))))
         (digits (map char->digit (string->list
                                   (number->string n)))))
    (= n (foldl
          (lambda (digit acc)
            (+ acc (expt digit (length digits))))
          0
          digits))))
