#lang racket

(provide rebase)

(define (enumerate lst . params)
  (let ((index (if (not (null? params)) (car params) 0)))
    (cond ((null? lst) '())
          (else (cons (cons index
                            (car lst))
                      (enumerate (cdr lst) (+ 1 index)))))))

(define (rebase list-digits in-base out-base)
  (call-with-current-continuation
   (lambda (return)
     (if (or (< in-base 2)
             (< out-base 2))
         (return #f)
         (letrec ((core (foldl
                         (lambda (pair acc)
                           (let ((index (car pair))
                                 (digit (cdr pair)))
                             (+ acc (* (if (member digit (range in-base))
                                           digit
                                           (return #f))
                                       (expt in-base index)))))
                         0
                         (enumerate (reverse list-digits))))
                  (convert (lambda (base num (acc '()))
                             (let ((quot (quotient num base))
                                   (rem (remainder num base)))
                               (if (= 0 quot)
                                   (cons rem acc)
                                   (convert base quot (cons rem acc)))))))
           (convert out-base core))))))
