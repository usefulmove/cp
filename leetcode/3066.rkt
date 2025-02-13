#lang racket

(define (min-operations nums k)
  (let loop ((ns nums)
             (operations 0))
    (cond ((>= (apply min ns) k) operations)
          ((< (length ns) 2) (error))
          (else (let* ((sorted-ns (sort ns <))
                       (a (car sorted-ns))
                       (b (cadr sorted-ns))
                       (ns-rest (cddr sorted-ns)))
                  (loop (cons (+ (* a 2) b) ns-rest)
                        (+ operations 1)))))))

(min-operations '(2 11 10 1 3) 10) ; => 2
(min-operations '(1 1 2 4 9) 20) ; => 4
