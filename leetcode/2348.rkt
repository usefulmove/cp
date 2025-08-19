#lang racket

(define (zero-filled-subarray nums)
  (let loop ((xs nums) (cnt 0) (groups '()))
    (cond ((empty? xs) (foldl
                        (lambda (x acc)
                          (+ acc (/ (* x (+ x 1)) 2)))
                        0
                        (cons cnt groups)))
          ((zero? (car xs)) (loop (cdr xs)
                                  (+ cnt 1)
                                  groups))
          (else (loop (cdr xs)
                      0 ; reset
                      (cons cnt groups))))))

(zero-filled-subarray '(1 3 0 0 2 0 0 4)) ; => 6
(zero-filled-subarray '(0 0 0 2 0 0)) ; => 9
(zero-filled-subarray '(2 10 2019)) ; => 0
