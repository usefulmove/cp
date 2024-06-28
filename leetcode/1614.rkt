#lang racket


(define (max-depth s)
  (cdr 
   (foldl
    (lambda (a acc)
      (let* ((level (car acc))
             (max-so-far (cdr acc))
             (current-level (cond ((equal? a #\() (add1 level))
                                  ((equal? a #\)) (sub1 level))
                                  (else level))))
        (cons current-level
              (if (> current-level max-so-far)
                  current-level ; update max
                  max-so-far))))
    '(0 . 0) ; (level . max-so-far)
    (string->list s))))


(max-depth "(1+(2*3)+((8)/4))+1")
(max-depth "(1)+((2))+(((3)))")
