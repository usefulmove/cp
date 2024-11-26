#lang racket

#;(define (find-champion n edges)
  (let loop ((es edges)
             (possible-champs (range n)))
    (if (empty? es)
        (if (= 1 (length possible-champs))
            (first possible-champs)
            -1)
            (loop (cdr es)
                  (remove (second (car es)) possible-champs)))))

(define (find-champion n edges)
  (let ((possible-champs (foldl
                          (lambda (e acc-possibles)
                            (remove (second e) acc-possibles))
                          (range n) ; possible champions
                          edges)))
    (if (= 1 (length possible-champs))
        (first possible-champs)
        -1)))

(find-champion 3 '((0 1) (1 2)))
(find-champion 4 '((0 2) (1 3) (1 2)))
