#lang racket

(define (min-deletion s k)
  (let* ((counter (lambda (lst)
                    (let loop ((cs lst)
                               (cnts '())) ; assoc list
                      (if (empty? cs)
                          (reverse cnts)
                          (let* ((c (car cs))
                                 (ind (index-of (map car cnts) c)))
                            (loop (cdr cs)
                                  (if ind
                                      (append (take cnts ind)
                                              (let ((c-cnt (cdr
                                                            (list-ref cnts ind))))
                                                (list (cons c (+ c-cnt 1))))
                                              (drop cnts (+ ind 1)))
                                      (cons (cons c 1) cnts))))))))
         (counts (counter (string->list s)))
         (len-counts (length counts))
         (remove (if (< k len-counts)
                     (- len-counts k)
                     0)))
    (apply + (take
              (sort (map cdr counts) <)
              remove))))

(min-deletion "abc" 2)
(min-deletion "aabb" 2)
(min-deletion "yyyzz" 1)
