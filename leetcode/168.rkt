#lang racket

(define (convert-to-title column-number)
  (let ((base 26))
    (let loop ((n column-number)
               (output '()))
      (if (<= n base)
          (apply string (cons (integer->char (+ n 64))
                              output))
          (let ((quo (quotient n base))
                (rem (remainder n base)))
            (if (= rem 0)
                (loop (- quo 1)
                      (cons #\Z output))
                (loop quo
                      (cons (integer->char (+ rem 64))
                            output))))))))

(convert-to-title 1)
(convert-to-title 28)
(convert-to-title 701)
(convert-to-title 52)
(convert-to-title 702)
