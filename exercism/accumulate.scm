(define (accumulate f xs)
  (cond ((null? xs) '())
        (else (cons (f (car xs))
                    (accumulate f (cdr xs))))))

(display
 (accumulate (lambda (a) (* a a a)) '(3 1 2 5 4)))
(newline)
