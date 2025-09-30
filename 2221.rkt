#lang racket

(define (triangular-sum nums)
  (let ((reduce (lambda (nums)
                  (let loop ((ns nums) (acc '()))
                    (if (empty? (cdr ns))
                        acc
                        (loop (cdr ns)
                              (cons
                               (remainder (+ (car ns) (cadr ns)) 10)
                               acc)))))))
    (if (empty? (cdr nums))
        (car nums)
        (triangular-sum (reduce nums)))))

(triangular-sum '(1 2 3 4 5)) ; => 8
(triangular-sum '(5)) ; => 5
