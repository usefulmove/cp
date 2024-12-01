#lang racket

(define (check-if-exist arr)
  (let loop ((ns arr))
    (cond ((empty? ns) #f)
          ((member
            (* 2 (car ns))
            (remove (car ns) arr)) #t)
          (else (loop (cdr ns))))))

(check-if-exist '(10 2 5 3))
(check-if-exist '(3 1 7 11))
