#lang racket

(define (binary-tree-paths root)
  (-> (or/c tree-node? #f) (listof string?))
  (letrec ((traverse (lambda (node acc)
                       (cond ((not (tree-node? node)) '(())) ; not node?
                             ((and (not (tree-node? (tree-node-left node))) ; leaf?
                                   (not (tree-node? (tree-node-right node))))
                              (list (append
                                     acc
                                     (list (list (tree-node-val node))))))
                             (else (append
                                    (traverse
                                     (tree-node-left node)
                                     (list (append
                                            acc
                                            (list (tree-node-val node)))))
                                    (traverse
                                     (tree-node-right node)
                                     (list (append
                                            acc
                                            (list (tree-node-val node))))))))))
           (paths (traverse root '())))
    (map
     (lambda (lst)
       (string-join (map number->string (flatten lst)) "->"))
     (filter (lambda (lst) (not (null? lst))) paths))))
