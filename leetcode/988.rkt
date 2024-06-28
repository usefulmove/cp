#lang racket


(define (smallest-from-leaf root)
  (letrec ((convert-value (lambda (n)
                            (string (integer->char (+ n (char->integer #\a))))))
           (traverse (lambda (node s)
                       (let ((updated-s (if (tree-node? node)
                                            (string-append (convert-value (tree-node-val node)) s)
                                            "")))
                         (cond ((not (tree-node? node)) '()) ; not node? return null.
                               ((and (not (tree-node? (tree-node-left node))) ; leaf? return updated s in list.
                                     (not (tree-node? (tree-node-right node))))
                                (list updated-s))
                               (else (append (traverse (tree-node-left node) updated-s)
                                             (traverse (tree-node-right node) updated-s))))))))
    (car (sort (traverse root "") string<=?))))
