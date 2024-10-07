#lang racket


(define (min-length s)
  (let* ((string-reduce (lambda (pattern s)
                          (regexp-replace pattern s "")))
         (reduced-s (string-reduce #rx"CD" (string-reduce #rx"AB" s))))
    (if (equal? s reduced-s)
      (string-length reduced-s)
      (min-length reduced-s))))


(min-length "ABFCACDB")
(min-length "ACBBD")
