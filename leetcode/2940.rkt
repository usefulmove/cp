#lang racket

(define (leftmost-building-queries heights queries)
  (let ((indicies (range (length queries))))
    (map
     (lambda (index)
       (let* ((query (list-ref queries index))
              (a (first query))
              (b (second query))
              (a-height (list-ref heights a))
              (b-height (list-ref heights b)))
         (let* ((start (max a b)))
           (let loop ((ind start)
                      (hs (drop heights start)))
             (cond ((empty? hs) -1)
                   ((and (>= (car hs) a-height)
                         (>= (car hs) b-height)) ind)
                   (else (loop (+ ind 1)
                               (cdr hs))))))))
     indicies)))

(leftmost-building-queries '(6 4 8 5 2 7) '((0 1) (0 3) (2 4) (3 4) (2 2))) ; => '(2 5 -1 5 2)
(leftmost-building-queries '(5 3 8 2 6 1 4 6) '((0 7) (3 5) (5 2) (3 0) (1 6))) ; => '(7 6 -1 4 6)
