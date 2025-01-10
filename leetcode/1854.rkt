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
          (+ 1950 (let loop ((index 0)
                             (max-so-far 0)
                             (index-at-max 0))
                    (if (= (+ index 1950) 2051)
                        index-at-max
                        (if (> (list-ref populations index) max-so-far)
                            (loop (+ index 1)
                                  (list-ref populations index)
                                  index)
                            (loop (+ index 1)
                                  max-so-far
                                  index-at-max)))))
          (loop (cdr ls)
                (update-populations (car ls) populations))))))

(maximum-population '((1993 1999) (2000 2010))) ; => 1993
(maximum-population '((1950 1961) (1960 1971) (1970 1981))) ; => 1960
