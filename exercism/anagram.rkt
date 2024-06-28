#lang racket

(provide anagrams-for)

(define (anagrams-for subject candidates)
  (let* ((normalise (lambda (word)
                      (sort
                       (string->list (string-downcase word)) char<?)))
         (subject-norm (normalise subject)))
    (filter
     (lambda (candidate)
       (and (equal? subject-norm
                    (normalise candidate))
            (not (string=? (string-downcase subject)
                           (string-downcase candidate)))))
     candidates)))
