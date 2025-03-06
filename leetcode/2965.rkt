#lang racket

(define (find-missing-and-repeated-values grid)
  (let ((n (length grid))
        (remove-if-found (lambda (value check-list)
                           (if (member value check-list)
                               (remove value check-list)
                               check-list))))
    (let loop ((vals (flatten grid))
               (seen '())
               (repeated '())
               (missing (range 1 (+ (* n n) 1))))
      (if (empty? vals)
          (append (remove-duplicates repeated)
                  missing)
          (let ((val (car vals)))
            (if (member val seen)
                (loop (cdr vals)
                      seen
                      (cons val repeated)
                      (remove-if-found val missing))
                (loop (cdr vals)
                      (cons val seen)
                      repeated
                      (remove-if-found val missing))))))))

(find-missing-and-repeated-values '((1 3) (2 2)))
