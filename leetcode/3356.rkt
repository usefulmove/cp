#lang racket

(define (min-zero-array nums queries)
  (let* ((zeros? (lambda (as)
                   (empty? (filter positive? as))))
         (result (foldl
                  (lambda (query acc)
                    (let ((k (car acc))
                          (ns (cdr acc))
                          (from (car query))
                          (to (cadr query))
                          (limit (caddr query)))
                      (println ns)
                      (if (zeros? ns)
                          acc
                          (cons (add1 k)
                                (reverse (foldl
                                          (lambda (n acc-inner)
                                            (cons
                                             (cond ((zero? n) 0)
                                                   ((>= n limit) (- n limit))
                                                   (else 0))
                                             acc-inner))
                                          '()
                                          ns))))))
                  (cons 0 nums)
                  queries))
         (k (car result))
         (out (cdr result)))
    (if (zeros? out) k -1)))

(min-zero-array '(2 0 2) '((0 2 1) (0 2 1) (1 1 3)))
(min-zero-array '(4 3 2 1) '((1 3 2) (0 2 1)))
(min-zero-array '(8 4) '((0 1 5) (1 1 5) (1 1 3) (1 1 4) (0 0 3) (1 1 4) (0 1 2) (1 1 3) (1 1 1)))
