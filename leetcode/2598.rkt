#lang racket

(define (find-smallest-integer nums value)
  (let* ((index-counts (let loop ((xs nums)
                                  (index-cnts (make-list value 0)))
                         (if (empty? xs)
                             index-cnts
                             (let ((ind (modulo (car xs) value)))
                               (loop (cdr xs)
                                     (list-set
                                      index-cnts
                                      ind
                                      (add1 (list-ref index-cnts ind))))))))
         (stop-count (apply min index-counts)))
    (let loop ((ics index-counts)
               (ind 0))
      (if (= stop-count (car ics))
          (+ ind (* value (car ics)))
          (loop (cdr ics)
                (add1 ind))))))

(find-smallest-integer '(1 -10 7 13 6 8) 5) ; => 4
(find-smallest-integer '(1 -10 7 13 6 8) 7) ; => 2
