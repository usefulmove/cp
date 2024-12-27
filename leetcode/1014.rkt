#lang racket

(define (max-score-sightseeing-pair values)
  (let ((enum-values (let loop ((vals values)
                                (ind 0)
                                (out '()))
                       (if (empty? vals)
                           (reverse out)
                           (loop (cdr vals)
                                 (+ ind 1)
                                 (cons (cons ind (car vals))
                                       out))))))
    (let loop ((evs enum-values)
               (max-so-far 0))
      (if (empty? (cdr evs))
          max-so-far
          (let ((i (caar evs))
                (n-i (cdar evs)))
            (loop (cdr evs)
                  (max max-so-far
                       (apply max (map
                                   (lambda (pair)
                                     (let ((j (car pair))
                                           (n-j (cdr pair)))
                                       (+ n-i n-j i (- j))))
                                   (cdr evs))))))))))

(max-score-sightseeing-pair '(8 1 5 2 6))
(max-score-sightseeing-pair '(1 2))
(max-score-sightseeing-pair '(1 3 5))
