#lang racket

(define (remove-occurrences s part)
  (let* ((reduced-s (string-replace s part "" #:all? #f)))
    (if (equal? s reduced-s)
        s
        (remove-occurrences reduced-s part))))

(remove-occurrences "daabcbaabcbc" "abc")
(remove-occurrences "axxxxyyyyb" "xy")
(remove-occurrences "aabababa" "aba")
