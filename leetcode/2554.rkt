#lang racket

(define (max-count banned n max-sum)
  (let ((banned-set (list->set banned)))
    (let loop ((as (range 1 (+ n 1)))
               (sum 0)
               (count 0))
      (cond ((> sum max-sum) (- count 1))
            ((empty? as) count)
            (else (let* ((a (car as))
                         (valid (not (or (set-member? banned-set a)
                                         (> a max-sum)))))
                    (loop (cdr as)
                          (if valid (+ sum a) sum)
                          (if valid (+ count 1) count))))))))

(max-count '(1 6 5) 5 6) ; => 2
(max-count (range 8) 8 1) ; => 0
(max-count '(11) 7 50) ; => 7
