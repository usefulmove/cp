(import (rnrs))

(define (pangram? phrase)
  (let ((phrase (string->list
                 (string-downcase phrase))))
    (fold-left
     (lambda (acc c)
       (and acc
            (not (equal? #f (member c phrase)))))
     #t
     (string->list "abcdefghijklmnopqrstuvwxyz"))))
