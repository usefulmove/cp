#lang racket

(define (shortest-distance-after-queries n queries)
  (let ((city-pairs (map
                     (lambda (a) (cons a 1))
                     (range n))))
    (let loop ((qs queries)
               (cps city-pairs)
               (output '()))
      (if (empty? qs)
          (reverse output)
          (let ((updated-cps todo))
            (loop (cdr qs)
                  updated-cps
                  (cons (- (apply + (map cdr updated-cps)) 1)
                        output)))))))

(shortest-distance-after-queries 5 '((2 4) (0 2) (0 4)))
