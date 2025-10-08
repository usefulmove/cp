#lang racket

(define (successful-pairs spells potions success)
  (let* ((sorted-potions (sort potions <))
         (num-potions (length potions))
         (find-potions-ind (lambda (spell) ; binary search
                             (let loop ((left 0)
                                        (right (- num-potions 1)))
                               (let* ((mid (floor (/ (+ left right) 2)))
                                      (val (list-ref sorted-potions mid)))
                                 (cond ((> left right) left) 
                                       ((>= (* val spell) success)
                                        (loop left (- mid 1)))
                                       (else (loop (+ mid 1) right))))))))
    (map
     (lambda (spell) (- num-potions (find-potions-ind spell)))
     spells)))

#;(define (successful-pairs spells potions success)
  (map
   (lambda (s)
     (count
      (lambda (p) (>= (* s p) success))
      potions))
   spells))

(successful-pairs '(5 1 3) '(1 2 3 4 5) 7) ; '(4 0 3)
(successful-pairs '(3 1 2) '(8 5 8) 16) ; '(2 0 2)
