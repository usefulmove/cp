#lang racket

(define (num-equiv-domino-pairs dominoes)
  (let* ((aligned-dominoes (map
                            (lambda (pair) (sort pair <))
                            dominoes))
         (counts (let loop ((ds aligned-dominoes)
                            (cnts '())) ; assoc list
                   (if (empty? ds)
                       (map cdr cnts)
                       (let* ((c (car ds))
                              (ind (index-of (map car cnts) c)))
                         (loop (cdr ds)
                               (if ind
                                   (append (take cnts ind)
                                           (let ((c-cnt (cdr
                                                         (list-ref cnts ind))))
                                             (list (cons c (+ c-cnt 1))))
                                           (drop cnts (+ ind 1)))
                                   (cons (cons c 1) cnts))))))))
    (foldl
     (lambda (c acc)
       (+ acc (/ (* c ( - c 1)) 2))) ; triangular numbers
     0
     counts)))

(num-equiv-domino-pairs '((1 2) (2 1) (3 4) (5 6)))
(num-equiv-domino-pairs '((1 2) (1 2) (1 1) (1 2) (2 2)))
