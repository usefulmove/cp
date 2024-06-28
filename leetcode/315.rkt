#lang racket


(define (count-smaller nums)
  (let ((slice (lambda (lst i j)
                 (drop(take lst j) i)))
        (zip (lambda (lst . lsts) (apply map list lst lsts)))
        (len (length nums)))
    (map
     (lambda (pair)
       (let* ((i (car pair))
              (num (cadr pair))
              (nums-after-self (slice nums (add1 i) len)))
         (count (lambda (a) (< a num)) nums-after-self)))
     (zip (range len) nums))))


(count-smaller '(5 2 6 1))
(count-smaller '(0))
(count-smaller '(-1 -1))
