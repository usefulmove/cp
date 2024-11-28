#lang racket

;; city pairs data structure
;; '((0 . (1)) (1 . (2)) (2 . (3)) (3 . (4)) (4 . (5))) ; initial structure
;; '((0 . (1)) (1 . (2)) (2 . (3 4)) (3 . (4)) (4 . (5))) ; after adding (2 4)
;; '((0 . (1 2)) (1 . (2)) (2 . (3 4)) (3 . (4)) (4 . (5))) ; after adding (0 2)
;; '((0 . (1 2 4)) (1 . (2)) (2 . (3 4)) (3 . (4)) (4 . (5))) ; after adding (0 4)
;; '((0 . (1 2 4)) (1 . (2)) (2 . (3 4)) (3 . (4)) (4 . (5))) ; after adding (0 4)

(define (shortest-distance-after-queries n queries)
  (letrec ((city-pairs (map
                        (lambda (a)
                          (cons a (list (+ a 1))))
                        (range n)))
           (distance (lambda (cps acc)
                       (cond ((empty? cps) acc)
                             ((= (- n 1) (car (car cps))) acc)
                             (else (apply min (map
                                               (lambda (destination)
                                                 (distance
                                                  (let loop ((pairs cps))
                                                    (let ((city (car (car pairs))))
                                                      (if (= destination city)
                                                          pairs
                                                          (loop (cdr pairs)))))
                                                  (+ 1 acc)))
                                               (cdr (car cps)))))))))
    (let loop ((qs queries)
               (cps city-pairs)
               (output '()))
      (if (empty? qs)
          (reverse output)
          (let* ((query (car qs))
                 (updated-cps (map
                               (lambda (cp)
                                 (let ((city (car cp))
                                       (roads (cdr cp))
                                       (from (first query))
                                       (to (second query)))
                                   (if (= city from)
                                       (cons city (cons to roads))
                                       cp)))
                               cps)))
            (loop (cdr qs)
                  updated-cps
                  (cons (distance updated-cps 0)
                        output)))))))

(shortest-distance-after-queries 5 '((2 4) (0 2) (0 4))) ; => '(3 2 1)
(shortest-distance-after-queries 4 '((0 3) (0 2))) ; => '(1 1)
(shortest-distance-after-queries 5 '((1 3) (2 4))) ; => '(3 3)
