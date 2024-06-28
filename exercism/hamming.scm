(import (rnrs))

(define (hamming-distance strand-a strand-b)
  (let ((zip (lambda (lst . lsts)
               (apply map list lst lsts))))
    (cond ((= (string-length strand-a)
              (string-length strand-b))
           (fold-left
            (lambda (acc pair)
              (if (equal? (car pair)
                          (cadr pair))
                  acc
                  (+ 1 acc)))
            0
            (zip (string->list strand-a)
                 (string->list strand-b))))
          (else (error "strands are not the same length")))))
