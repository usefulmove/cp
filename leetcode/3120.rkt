#lang racket

(define (number-of-special-chars word)
  (let ((counts (foldl
                 (lambda (c acc)
                   (let ((entry (assoc c acc)))
                     (if entry
                         (cons (cons c (+ 1 (cdr entry)))
                               (remove entry acc))
                         (cons (cons c 1)
                               acc))))
                 '()
                 (string->list word))))
    (foldl
     (lambda (pair acc)
       (let ((c (car pair)))
         (if (member c (string->list "abcdefghijklmnopqrstuvwxyz"))
             (let* ((matching-c (integer->char (- (char->integer c) 32)))
                    (entry (assoc matching-c counts)))
               (if entry
                   (+ 1 acc)
                   acc))
             acc)))
     0
     counts)))

(number-of-special-chars "aaAbcBC")
(number-of-special-chars "abc")
(number-of-special-chars "abBCab")
(number-of-special-chars "BBbab")
