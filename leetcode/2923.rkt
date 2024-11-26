#lang racket

(define (find-champion grid)
  (let loop ((subgrids grid)
             (possibles (range (length grid))))
    (if (empty? subgrids)
        (car possibles) ; champion
        (loop (cdr subgrids)
              (filter
               (lambda (possible)
                 (= 0 (list-ref (car subgrids) possible)))
               possibles)))))

(find-champion '((0 1) (0 0)))
(find-champion '((0 0 1) (1 0 1) (0 0 0)))
