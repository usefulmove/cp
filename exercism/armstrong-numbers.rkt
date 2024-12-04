#lang racket

(provide armstrong-number?)

(define (armstrong-number? n)
  (let* ((char->digit (lambda (c) (- (char->integer c)
                                     (char->integer #\0))))
         (digits (map char->digit (string->list
                                   (number->string n))))
         (num-digits (length digits)))
    (= n (foldl
          (lambda (digit acc)
            (+ acc (expt digit num-digits)))
          0
          digits))))
