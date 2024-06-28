#lang racket


#;(define (sum-numbers root (acc 0))
  (let ((update-acc (lambda (n)
                      (+ n (* acc 10)))))
    (cond ((not (tree-node? root)) 0) ; not a node
          ((and (not (tree-node? (tree-node-left root)))
                (not (tree-node? (tree-node-right root)))) ; leaf
           (update-acc (tree-node-val root)))
          (else (+ (sum-numbers
                    (tree-node-left root)
                    (update-acc (tree-node-val root)))
                   (sum-numbers
                    (tree-node-right root)
                    (update-acc (tree-node-val root))))))))


(define (sum-numbers root (acc 0))
  (let ((update-acc (lambda (n)
                      (+ n (* acc 10))))
        (node-value (if (tree-node? root)
                        (tree-node-val root)
                        #f))
        (left-node (if (tree-node? root)
                       (tree-node-left root)
                       #f))
        (right-node (if (tree-node? root)
                        (tree-node-right root)
                        #f)))
    (cond ((not node-value) 0) ; not a node
          ((and (not (tree-node? left-node))
                (not (tree-node? right-node))) ; leaf
           (update-acc node-value))
          (else (+ (sum-numbers left-node (update-acc node-value))
                   (sum-numbers right-node (update-acc node-value)))))))


#;(define (make-updater n)
  (let ((acc 0))
    (lambda (n)
      (set! acc (+ n (* acc 10)))
      (displayln n))))


#;(foldl
 (lambda (a acc)
   (+ a (* acc 10)))
 0
 '(3 1 2 0 5 4))
