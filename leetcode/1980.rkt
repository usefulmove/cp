#lang racket

(define (find-different-binary-string nums)
  (let* ((cnt (string-length (car nums)))
         (ns (map
              (lambda (num)
                (string->number num 2))
              nums))
         (unique-n (findf
                    (lambda (num)
                      (not (member num ns)))
                    (range (expt 2 cnt))))
         (convert (lambda (n)
                    (let* ((s (number->string n 2)))
                      (string-append
                       (make-string (- cnt (string-length s)) #\0)
                       s)))))
    (if unique-n (convert unique-n) "")))

(find-different-binary-string '("01" "10"))
(find-different-binary-string '("00" "01"))
(find-different-binary-string '("111" "011" "001"))
