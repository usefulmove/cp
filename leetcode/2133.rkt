#lang racket

(define (check-valid matrix)
  (let ((check-rows (lambda (mat)
                      (let loop ((rows mat)
                                 (out #t))
                        (if (empty? rows)
                            out
                            (loop (cdr rows)
                                  (and out
                                       (equal? (car rows)
                                               (remove-duplicates
                                                (car rows)))))))))
        (transposed (apply map list matrix)))
    (and (check-rows matrix)
         (check-rows transposed))))

(check-valid '((1 2 3) (3 1 2) (2 3 1))) ; => #t
(check-valid '((1 1 1) (1 2 3) (1 2 3))) ; => #f
(check-valid '((1 1 1) (1 2 3) (1 3 2))) ; => #f
