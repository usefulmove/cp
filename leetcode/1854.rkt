#lang racket

(define (maximum-population logs)
  (let ((update-populations (lambda (pop-log populations)
                              (let ((birth (first pop-log))
                                    (death (second pop-log)))
                                (let loop ((year 1950)
                                           (output '()))
                                  (if (= year 2051)
                                      (reverse output)
                                      (loop (+ year 1)
                                            (cons (if (and (>= year birth)
                                                           (< year death))
                                                      (+ 1 (list-ref populations (- year 1950)))
                                                      (list-ref populations (- year 1950)))
                                                  output))))))))
    (let loop ((ls logs)
               (populations (build-list
                             (+ 1 (- 2050 1950))
                             (lambda (_) 0))))
      (if (empty? ls)
          (+ 1950 (index-of populations (apply max populations)))
          (loop (cdr ls)
                (update-populations (car ls) populations))))))

(maximum-population '((1993 1999) (2000 2010))) ; => 1993
(maximum-population '((1950 1961) (1960 1971) (1970 1981))) ; => 1960
