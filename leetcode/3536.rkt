#lang racket

(define (max-product n)
  (let loop ((num n)
             (largest '(0 0))) ; '(a b) where a => b
    (if (zero? num)
        (apply * largest)
        (let ((digit (remainder num 10))
              (a (car largest))
              (b (cadr largest)))
          (loop (quotient num 10)
                (cond ((>= digit a) (list digit a))
                      ((>= digit b) (list a digit))
                      (else (list a b))))))))

#;(define (max-product n)
  (let ((digits (sort
                 (let loop ((num n)
                            (digs '()))
                   (if (zero? num)
                       digs
                       (loop (quotient num 10)
                             (cons (remainder num 10) digs))))
                 >)))
    (* (car digits)
       (cadr digits))))

(max-product 31) ; => 3
(max-product 22) ; => 4
(max-product 124) ; => 8
