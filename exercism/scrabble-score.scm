#;(define (score word)
  (fold-left
   (lambda (acc c)
     (+ acc (cond ((member c '(#\d #\g)) 2)
                  ((member c '(#\b #\c #\m #\p)) 3)
                  ((member c '(#\f #\h #\v #\w #\y)) 4)
                  ((member c '(#\k)) 5)
                  ((member c '(#\j #\x)) 8)
                  ((member c '(#\q #\z)) 10)
                  (else 1))))
   0
   (string->list (string-downcase word))))


(define (score word)
  (fold-left
   (lambda (acc c) (+ acc (case (char-downcase c)
                           ((#\d #\g) 2)
                           ((#\b #\c #\m #\p) 3)
                           ((#\f #\h #\v #\w #\y) 4)
                           ((#\k) 5)
                           ((#\j #\x) 8)
                           ((#\q #\z) 10)
                           (else 1))))
   0
   (string->list word)))
