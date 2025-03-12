#lang racket

(provide nth-prime)

(define (prime? n)
  (cond ((<= n 1) #f)
        ((= n 2) #t)
        ((even? n) #f)
        (else
         (let loop ((i 3))
           (cond ((> (* i i) n) #t)
                 ((zero? (remainder n i)) #f)
                 (else (loop (+ i 2))))))))

(define (nth-prime number)
  (if (not (positive? number))
      (raise (make-exn:fail
              "entered zero or negative number"
              (current-continuation-marks)))
      (let loop ((x 2) (n 1))
        (let ((x-prime? (prime? x)))
          (cond ((and x-prime?
                      (= n number)) x)
                (x-prime? (loop (add1 x) (add1 n)))
                (else (loop (add1 x) n)))))))
