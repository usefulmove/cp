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
                      (if (zeros? ns)
                          acc
                          (cons (add1 k)
                                (let loop ((as ns)
                                           (index 0)
                                           (out '()))
                                  (if (empty? as)
                                      (reverse out)
                                      (loop (cdr as)
                                            (add1 index)
                                            (cons
                                             (if (and (>= index from)
                                                      (<= index to))
                                                 (cond ((zero? (car as)) 0)
                                                       ((>= (car as) limit)
                                                        (- (car as) limit))
                                                       (else 0))
                                                 (car as))
                                             out))))))))
                  (cons 0 nums)
                  queries))
         (k (car result))
         (out (cdr result)))
    (if (zeros? out) k -1)))

(min-zero-array '(2 0 2) '((0 2 1) (0 2 1) (1 1 3))) ; => 2
(min-zero-array '(4 3 2 1) '((1 3 2) (0 2 1))) ; => -1
(min-zero-array '(8 4) '((0 1 5) (1 1 5) (1 1 3) (1 1 4) (0 0 3) (1 1 4) (0 1 2) (1 1 3) (1 1 1))) ; => 5
