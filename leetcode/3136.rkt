#lang racket

(define (is-valid word)
  (let ((chars (string->list word))
        (char-vowel? (lambda (c)
                       (member
                        (char-downcase c)
                        (string->list "aeiou")))))
    (and (> (string-length word) 2)
         (andmap
          (lambda (c)
            (or (char-alphabetic? c)
                (char-numeric? c)))
          chars)
         (ormap char-vowel? chars)
         (ormap
          (lambda (c)
            (and (not (char-vowel? c))
                 (not (char-numeric? c))))
          chars))))
