#lang racket

(define (check nums (cnt 0))
  (let* ((len (length nums))
         (sorted? (lambda (lst) (apply <= lst)))
         (rotate (lambda (lst) (cons (last lst)
                                     (take lst (- len 1))))))
    (cond ((= cnt len) #f)
          ((sorted? nums) #t)
          (else (check (rotate nums) (+ cnt 1))))))

#;(define (check nums)
    (let* ((count (length nums))
           (sorted? (lambda (lst)
                      (apply <= lst)))
           (rotate (lambda (lst)
                     (cons (last lst)
                           (take lst (- count 1))))))
      (let loop ((n count)
                 (ns nums))
        (cond ((= n 0) #f)
              ((sorted? ns) #t)
              (else (loop (- n 1)
                          (rotate ns)))))))

(check '(3 4 5 1 2)) ; => #t
(check '(2 1 3 4)) ; => #f
(check '(1 2 3)) ; => #t
(check '(1 1 1)) ; => #t
