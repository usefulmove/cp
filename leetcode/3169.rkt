#lang racket

(define (count-days days meetings)
  (foldl
   (lambda (day available-days)
     (+ available-days
        (if (foldl
             (lambda (meeting is-available)
               (let ((start (first meeting))
                     (end (second meeting)))
                 (and is-available
                      (not (<= start (add1 day) end)))))
             #t
             meetings)
            1
            0)))
   0
   (range days)))

#;(define (count-days days meetings)
    (count false? (foldl
              (lambda (meeting days-unavailable)
                (let ((start (first meeting))
                      (end (second meeting)))
                  (let loop ((days days-unavailable)
                            (index 0)
                            (output '()))
                    (cond ((empty? days) (reverse output))
                          ((<= start (+ index 1) end)
                          (loop (cdr days)
                                (+ index 1)
                                (cons #t output)))
                          (else (loop (cdr days)
                                      (+ index 1)
                                      (cons (car days) output)))))))
              (make-list days #f) ; days unavailable
              meetings)))

(count-days 10 '((5 7) (1 3) (9 10))) ; => 2
(count-days 5 '((2 4) (1 3))) ; => 1
(count-days 6 '((1 6))) ; => 0
