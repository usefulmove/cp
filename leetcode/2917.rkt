#lang racket

(define (find-k-or nums k)
  (let* ((bits (map
                (lambda (n)
                  (let* ((s (number->string n 2))
                         (len (string-length s)))
                    (append (make-list (- 32 len) #\0)
                            (string->list s))))
                nums))
         (bits-transposed (apply map list bits))
         (counts (map
                  (lambda (bs)
                    (count
                     (lambda (b) (equal? b #\1))
                     bs))
                  bits-transposed))
         (kor-bits (map
                    (lambda (c) (if (>= c k) #\1 #\0))
                    counts)))
    (string->number (list->string kor-bits) 2)))

(find-k-or '(7 12 9 8 9 15) 4) ; => 9
(find-k-or '(2 12 1 11 4 5) 6) ; => 0
(find-k-or '(10 8 5 9 11 6 8) 1) ; => 15
