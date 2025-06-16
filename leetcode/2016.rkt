#lang racket

(define (maximum-difference nums)
  (let loop ((ns nums)
             (max-diff-so-far -1))
    (if (empty? ns)
        max-diff-so-far
        (let* ((n (car ns))
               (candidates (filter
                            (lambda (a) (< n a))
                            (cdr ns))))
          (if (empty? candidates)
              (loop (cdr ns)
                    max-diff-so-far)
              (loop (cdr ns)
                    (max max-diff-so-far
                         (- (apply max candidates) n))))))))

(maximum-difference '(7 1 5 4)) ; => 4
(maximum-difference '(9 4 3 2)) ; => -1
(maximum-difference '(1 5 2 10)) ; => 9
