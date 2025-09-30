#lang racket

(define (triangular-sum nums)
  (let ((reduce (lambda (nums)
                  (let loop ((ns nums) (out '()))
                    (if (empty? (cdr ns))
                        out
                        (loop (cdr ns)
                              (cons
                               (remainder (+ (car ns) (cadr ns)) 10)
                               out)))))))
    (if (empty? (cdr nums))
        (car nums)
        (triangular-sum (reduce nums)))))

(triangular-sum '(1 2 3 4 5)) ; => 8
(triangular-sum '(5)) ; => 5
