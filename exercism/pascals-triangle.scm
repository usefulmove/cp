(import (rnrs))

(define (pascals-triangle n)
  (letrec* ((zip (lambda (lst1 lst2)
                   (cond ((or (null? lst1)
                              (null? lst2)) '())
                         (else (cons (list (car lst1) (car lst2))
                                     (zip (cdr lst1) (cdr lst2)))))))
            (collapse (lambda (lst)
                        (cond ((< (length lst) 2) '())
                              (else (let ((pairs (zip lst
                                                      (cdr lst))))
                                      (map
                                       (lambda (lst) (apply + lst))
                                       pairs))))))
            (add-caps (lambda (lst)
                        (cons 1
                              (append lst (list 1)))))
            (process-row (lambda (lst) ; returns next row (+ 1 n)
                           (add-caps
                            (collapse lst))))
            (last (lambda (lst)
                    (cond ((null? lst) '())
                          ((null? (cdr lst)) (car lst))
                          (else (last (cdr lst)))))))
    (cond ((< n 1) '())
          ((= n 1) '((1)))
          (else (let ((previous (pascals-triangle (- n 1))))
                  (append previous
                          (list (process-row (last previous)))))))))
