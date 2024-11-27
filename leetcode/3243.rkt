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
          (let* ((query (car qs))
                 (updated-cps (map
                               (lambda (city-pair)
                                 (let ((city (car city-pair))
                                       (on-off (cdr city-pair))
                                       (from (first query))
                                       (to (second query)))
                                   (if (and (> city from)
                                            (< city to))
                                       (cons city 0)
                                       city-pair)))
                               cps)))
            (println query)
            (println updated-cps)
            (loop (cdr qs)
                  updated-cps
                  (cons (- (apply + (map cdr updated-cps)) 1)
                        output)))))))

#;(shortest-distance-after-queries 5 '((2 4) (0 2) (0 4)))
#;(shortest-distance-after-queries 4 '((0 3) (0 2)))
(shortest-distance-after-queries 5 '((1 3) (2 4)))
