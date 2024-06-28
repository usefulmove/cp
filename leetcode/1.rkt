#lang racket

(define (two-sum nums target)
  (call-with-current-continuation
   (lambda (return)
     (for ((i (length nums)))
       (let* ((current-value (list-ref nums i))
              (matching-value (- target current-value))
              (j (index-of nums matching-value)))
         (when (and j (not (= i j)))
           (return (list i j))))))))

(two-sum '(2 7 11 15) 9)
(two-sum '(3 2 4) 6)
(two-sum '(3 3) 6)
