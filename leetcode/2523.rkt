#lang racket

(define (closest-primes left right)
  (let* ((prime? (lambda (n)
                   (cond ((<= n 1) #f)
                         ((= n 2) #t)
                         ((even? n) #f)
                         (else
                          (let loop ((i 3))
                            (cond
                              ((> (* i i) n) #t)
                              ((zero? (remainder n i)) #f)
                              (else (loop (+ i 2)))))))))
         (primes (filter
                  prime?
                  (range left (add1 right)))))
    (if (< (length primes) 2)
        '(-1 -1)
        (let loop ((as (take primes (sub1 (length primes))))
                   (bs (cdr primes))
                   (smallest-gap 10e6)
                   (output '(-1 -1)))
          (cond ((empty? as) output)
                ((< (- (car bs) (car as)) smallest-gap)
                 (loop (cdr as)
                       (cdr bs)
                       (- (car bs) (car as))
                       (list (car as) (car bs))))
                (else (loop (cdr as)
                            (cdr bs)
                            smallest-gap
                            output)))))))

(closest-primes 10 19)
(closest-primes 4 6)
(closest-primes 1 1)
