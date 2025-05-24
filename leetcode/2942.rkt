#lang racket

(define (find-words-containing words x)
  (-> (listof string?) char? (listof exact-integer?))
  (let loop ((ws words)
             (index 0)
             (out '()))
    (if (empty? ws)
        (reverse out)
        (loop (cdr ws)
              (add1 index)
              (if (member x (string->list (car ws)))
                  (cons index out)
                  out)))))
