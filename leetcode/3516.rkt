#lang racket

(define (find-closest x y z)
  (let ((dx (abs (- z x)))
        (dy (abs (- z y))))
    (cond ((= dx dy) 0)
          ((< dx dy) 1)
          (else 2))))

(find-closest 2 7 4) ; => 1
(find-closest 2 5 6) ; => 2
(find-closest 1 5 3) ; => 0
