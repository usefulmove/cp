#lang racket

(define (minimum-operations nums (operations 0))
  (cond ((equal? nums (remove-duplicates nums)) operations)
        ((< (length nums) 3) (add1 operations))
        (else (minimum-operations (drop nums 3) (add1 operations)))))

(minimum-operations '(1 2 3 4 2 3 3 5 7)) ; => 2
(minimum-operations '(4 5 6 4 4)) ; => 2
(minimum-operations '(6 7 8 9)) ; => 0
