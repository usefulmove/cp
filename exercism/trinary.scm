(import (rnrs))

(define (to-decimal s)
  (call/cc
   (lambda (return)
     (letrec ((digits (reverse (map
                                (lambda (c) (- (char->integer c)
                                               (char->integer #\0)))
                                (string->list s))))
              (process (lambda (lst index acc)
                         (cond ((null? lst) acc)
                               (else (let* ((digit (car lst))
                                            (updated-acc (+ acc
                                                            (* digit
                                                               (expt 3 index)))))
                                       (if (not (member digit '(0 1 2)))
                                           (return 0)
                                           (process
                                            (cdr lst)
                                            (+ 1 index)
                                            updated-acc))))))))
       (process digits 0 0)))))
