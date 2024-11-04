#lang racket

(define (compressed-string word)
  (let ((compressed-pairs (foldl
                           (lambda (c acc)
                             (if (null? acc)
                                 (list (cons c 1))
                                 (let* ((last-pair (last acc))
                                        (last-char (car last-pair))
                                        (last-count (cdr last-pair)))
                                   (if (and (equal? c last-char)
                                            (< last-count 9)) 
                                       (append (take acc (- (length acc) 1))
                                               (list (cons c (+ 1 last-count))))
                                       (append acc (list (cons c 1)))))))
                           '() ; '((#\a . 9) (#\a . 5) (#\b . 2) ...)
                           (string->list word))))
    (foldl
     (lambda (pair acc)
       (string-append acc
                      (number->string (cdr pair))
                      (string (car pair))))
     ""
     compressed-pairs)))
