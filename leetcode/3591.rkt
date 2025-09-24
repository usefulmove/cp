#lang racket

(define (check-prime-frequency nums)
  (let ((prime? (lambda (n)
                  (member n '(2  3  5  7  11  13  17  19  23  29  31 37  41 43
                              47  53 59  61  67  71  73  79 83  89  97))))
        (counts (let loop ((cs nums)
                           (cnts '())) ; assoc list
                  (if (empty? cs)
                      (reverse cnts)
                      (let* ((c (car cs))
                             (ind (index-of (map car cnts) c)))
                        (loop (cdr cs)
                              (if ind
                                  (append (take cnts ind)
                                          (let ((c-cnt (cdr
                                                        (list-ref cnts ind))))
                                            (list (cons c (+ c-cnt 1))))
                                          (drop cnts (+ ind 1)))
                                  (cons (cons c 1) cnts))))))))
    (let loop ((cnts (map cdr counts)))
      (cond ((empty? cnts) #f)
            ((prime? (car cnts)) #t)
            (else (loop (cdr cnts)))))))

(check-prime-frequency '(1 2 3 4 5 4)) ; => #t
(check-prime-frequency '(1 2 3 4 5)) ; => #f
(check-prime-frequency '(2 2 2 4 4)) ; => #t
