#lang racket

(define (compressed-string word)
  (let ((compressed-pairs (foldl
                           (lambda (c acc)
                             (cond ((null? acc) (list (cons c 1)))
                                   ((and (equal? c (car (last acc)))
                                         (< (cdr (last acc)) 9)) 
                                    (append (take acc (- (length acc) 1))
                                            (list (cons c (+ 1 (cdr (last acc)))))))
                                   (else (append acc (list (cons c 1))))))
                           '() ; '((#\a . 9) (#\a . 5) (#\b . 2) ...)
                           (string->list word))))
    (println compressed-pairs)
    (foldl
     (lambda (pair acc)
       (string-append acc
                      (number->string (cdr pair))
                      (string (car pair))))
     ""
     compressed-pairs)))
