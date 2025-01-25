#lang racket

(define (eventual-safe-nodes graph)
  (letrec ((safe-node? (lambda (node (seen '()))
                         (let ((jumps (list-ref graph node)))
                           (cond ((member node seen) #f) ; node visited before?
                                 ((empty? jumps) #t) ; terminal node?
                                 (else (andmap
                                        (lambda (jump)
                                          (safe-node? jump (cons node seen)))
                                        jumps))))))
           (nodes (range (length graph))))
    (filter safe-node? nodes)))

(eventual-safe-nodes '((1 2) (2 3) (5) (0) (5) () ()))
(eventual-safe-nodes '((1 2 3 4) (1 2) (3 4) (0 4) ()))
