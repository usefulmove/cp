#lang racket

(define (apply-operations nums)
  (let loop ((ns nums)
             (vals '())
             (zeros '()))
    (cond ((empty? ns) (append (reverse vals) zeros))
          ((zero? (car ns)) (loop (cdr ns)
                                  vals
                                  (cons 0 zeros)))
          ((empty? (cdr ns)) (loop (cdr ns)
                                   (cons (car ns) vals)
                                   zeros))
          ((= (car ns)
              (cadr ns)) (loop (cddr ns)
                               (cons (* (car ns) 2) vals)
                               (cons 0 zeros)))
          (else (loop (cdr ns)
                      (cons (car ns) vals)
                      zeros)))))

(apply-operations '(1 2 2 1 1 0))
