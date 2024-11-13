#lang racket

(define (count-fair-pairs nums lower upper)
  (let loop ((ns nums)
             (cnt 0))
    (if (empty? ns)
        cnt
        (loop (cdr ns)
              (+ cnt (count
                      (lambda (m)
                        (let* ((n (car ns))
                               (sum (+ n m)))
                          (and (>= sum lower)
                               (<= sum upper))))
                      (cdr ns)))))))

(count-fair-pairs '(0 1 7 4 4 5) 3 6)
(count-fair-pairs '(1 7 9 2 5) 11 11)
