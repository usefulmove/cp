(import (rnrs))

(define (classify n)
  (cond ((<= n 0) (error 'classify "invalid input"))
        ((= n 1) 'deficient)
        (else 
         (let ((aliquot (fold-left
                         (lambda (acc a)
                           (+ acc
                              (if (zero? (mod n a)) a 0)
                              (if (and (zero? (mod n a))
                                       (not (= a (/ n a)))
                                       (not (= n (/ n a)))) (/ n a) 0)))
                         0
                         (cdr (iota (+ 1 (exact (floor (sqrt n)))))))))
           (cond ((= n aliquot) 'perfect)
                 ((< n aliquot) 'abundant)
                 ((> n aliquot) 'deficient))))))
