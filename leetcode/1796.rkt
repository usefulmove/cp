#lang racket

(define (second-highest s)
  (let ((digits (map
                 (lambda (c) (- (char->integer c) 48))
                 (remove-duplicates (filter
                                     char-numeric?
                                     (string->list s))))))
    (if (< (length digits) 2)
        -1
        (second (sort digits >)))))

(second-highest "dfa12321afd") ; => 2
(second-highest "abc1111") ; => -1
