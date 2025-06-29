#lang racket

(define (merge-similar-items items1 items2)
  (let ((sort-items (lambda (items)
                      (sort items (lambda (a b)
                                    (< (car a) (car b)))))))
    (let loop ((as (sort-items items1))
               (bs (sort-items items2))
               (output '()))
      (cond ((and (empty? as)
                  (empty? bs)) (reverse output))
            ((empty? as) (loop '()
                               (cdr bs)
                               (cons (car bs) output)))
            ((empty? bs) (loop (cdr as)
                               '()
                               (cons (car as) output)))
            ((= (caar as)
                (caar bs)) (loop (cdr as)
                                 (cdr bs)
                                 (cons (list (caar as)
                                             (+ (cadar as)
                                                (cadar bs)))
                                       output)))
            ((< (caar as)
                (caar bs)) (loop (cdr as)
                                 bs
                                 (cons (car as) output)))
            (else (loop as
                        (cdr bs)
                        (cons (car bs) output)))))))

(merge-similar-items '((1 1) (4 5) (3 8)) '((3 1) (1 5))) ; => '((1 6) (3 9) (4 5))
