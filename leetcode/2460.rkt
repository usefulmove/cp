#lang racket

(define (apply-operations nums)
  (let* ((processed-nums (let loop ((ns nums)
                                    (output '()))
                           (cond ((empty? ns) (reverse output))
                                 ((empty? (cdr ns)) (loop (cdr ns)
                                                          (cons (car ns) output)))

                                 ((= (car ns)
                                     (cadr ns)) (loop (cddr ns)
                                                      (cons 0 (cons (* (car ns) 2)
                                                                    output))))
                                 (else (loop (cdr ns)
                                             (cons (car ns) output))))))
         (nonzero-vals (filter
                        (lambda (a)
                          (not (zero? a)))
                        processed-nums))
         (zeros (filter zero? processed-nums)))
    (append nonzero-vals zeros)))

(apply-operations '(1 2 2 1 1 0))
