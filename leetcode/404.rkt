#lang racket

(define (sum-of-left-leaves root (is-left-node #f))
  (cond ((not (tree-node? root)) 0)
        ((and is-left-node
              (not (or (tree-node? (tree-node-left root))
                       (tree-node? (tree-node-right root)))))
         (tree-node-val root))
        (else (+ (sum-of-left-leaves (tree-node-left root) #t)
                 (sum-of-left-leaves (tree-node-right root) #f)))))
