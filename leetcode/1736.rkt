#lang racket

(define/contract (maximum-time s)
  (-> string? string?)
  (let ((chars (string->list s))
        (list-update (lambda (lst ind value)
                       (append (take lst ind)
                               (list value)
                               (drop lst (+ ind 1))))))

    (when (equal? #\? (list-ref chars 4))
      (set! chars (list-update chars 4 #\9)))

    (when (equal? #\? (list-ref chars 3))
      (set! chars (list-update chars 3 #\5)))

    (when (equal? #\? (list-ref chars 1))
      (if (or (equal? #\2 (list-ref chars 0))
              (equal? #\? (list-ref chars 0)))
          (set! chars (list-update chars 1 #\3))
          (set! chars (list-update chars 1 #\9))))

    (when (equal? #\? (list-ref chars 0))
      (if (or (equal? #\0 (list-ref chars 1))
              (equal? #\1 (list-ref chars 1))
              (equal? #\2 (list-ref chars 1))
              (equal? #\3 (list-ref chars 1)))
          (set! chars (list-update chars 0 #\2))
          (set! chars (list-update chars 0 #\1))))

    (list->string chars)))
