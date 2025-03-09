#lang racket

(define (largest-values root)
  (letrec ((vals '())
           (evaluate (lambda (node level)
                       (if (tree-node? node)
                           (begin
                             (set! vals (cons (cons
                                               level
                                               (tree-node-val node))
                                              vals))
                             (evaluate
                              (tree-node-left node)
                              (add1 level))
                             (evaluate
                              (tree-node-right node)
                              (add1 level)))
                           (void)))))
    (evaluate root 0)
    (if (empty? vals)
        '()
        (let ((depth (let loop ((pairs vals)
                                (max-so-far 0))
                       (cond ((empty? pairs) max-so-far)
                             ((> (caar pairs) max-so-far) (loop (cdr pairs)
                                                                (caar pairs)))
                             (else (loop (cdr pairs)
                                         max-so-far))))))
          (let loop ((pairs vals)
                     (output (make-list (add1 depth) -2e32)))
            (cond ((empty? pairs) output)
                  ((< (list-ref output (caar pairs)) (cdar pairs))
                   (loop (cdr pairs)
                         (list-set output (caar pairs) (cdar pairs))))
                  (else (loop (cdr pairs) output))))))))
