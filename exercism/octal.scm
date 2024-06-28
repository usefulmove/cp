(import (rnrs))

(define (to-decimal s)
  (call-with-current-continuation
   (lambda (return)
     (let ((zip (lambda (lst . lsts)
                  (apply map list lst lsts))))
       (fold-left
        (lambda (acc pair)
          (let ((index (car pair))
                (digit (cadr pair)))
            (if (member digit (iota 8))
                (+ acc
                   (* digit (expt 8 index) ))
                (return 0)))) ; invalid digit
        0
        (zip (iota (string-length s)) ; zip with index (enumerate)
             (map ; map digit values
              (lambda (c) (- (char->integer c)
                             (char->integer #\0)))
              (reverse (string->list s)))))))))
