#lang racket

(define (kth-largest-level-sum root k)
  (letrec ((level-sums '()) ; (level . sum) assoc list
           (update-level-sums
            (lambda (node level)
              (cond ((not (tree-node? node)) (void))
                    ((null? node) (void))
                    (else (let* ((node-value (tree-node-val node))
                                 (level-pair (assoc level level-sums)))
                            (if level-pair
                                (set! level-sums (map
                                                  (lambda (pair)
                                                    (if (= level (car pair))
                                                        (cons level (+ node-value
                                                                       (cdr level-pair)))
                                                        pair))
                                                  level-sums))
                                (set! level-sums (cons (cons level node-value)
                                                       level-sums)))
                            (update-level-sums (tree-node-left node) (+ 1 level))
                            (update-level-sums (tree-node-right node) (+ 1 level))))))))

    (update-level-sums root 1) ; updates level-sums

    (if (> k (length level-sums))
        -1
        (let ((sorted-sums (sort (map cdr level-sums) >)))
          (list-ref sorted-sums (- k 1))))))
