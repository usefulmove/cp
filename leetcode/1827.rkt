#lang racket

(define (min-operations nums)
  (let loop ((ns nums)
             (ops 0))
    (cond ((empty? ns) ops)
          ((empty? (cdr ns)) (loop (cdr ns) ops))
          ((<= (second ns)
               (first ns)) (loop (cons (+ (first ns) 1)
                                       (cddr ns))
                                 (+ ops (- (+ (first ns) 1)
                                           (second ns)))))
          (else (loop (cdr ns) ops)))))

#;(define (min-operations nums)
  (let ((comp (let loop ((ns nums)
                         (out '()))
                (cond ((empty? ns) (reverse out))
                      ((empty? (cdr ns)) (loop (cdr ns)
                                               (cons (car ns) out)))
                      ((<= (cadr ns)
                           (car ns)) (loop (cons (+ (car ns) 1)
                                                 (cddr ns))
                                           (cons (car ns) out)))
                      (else (loop (cdr ns)
                                  (cons (car ns) out)))))))
    (foldl
     (lambda (n c acc) (+ acc (- c n)))
     0
     nums
     comp)))

(min-operations '(1 1 1))
(min-operations '(1 5 2 4 1))
(min-operations '(8))
