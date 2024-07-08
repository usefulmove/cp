#lang racket

; rotate the string by the modulus of k and the string length
(define (get-encrypted-string s k)
  (let ((n (modulo k (string-length s))))
    (string-append (substring s n)
                   (substring s 0 n))))

(get-encrypted-string "dart" 3)
