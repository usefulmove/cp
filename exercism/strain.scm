(define (keep pred seq)
  (cond ((null? seq) '())
        ((pred (car seq)) (cons (car seq)
                                (keep pred (cdr seq))))
        (else (keep pred (cdr seq)))))

(define (discard pred seq)
  (keep (lambda (a) (not (pred a))) seq))

(display
 (keep even? '(1 2 3 4 5)))
(newline)
(display
 (discard even? '(1 2 3 4 5)))
(newline)
