#lang racket

(define (count-prefix-suffix-pairs words)
  (let* ((is-prefix? (lambda (chars1 chars2)
                       (if (> (length chars1)
                              (length chars2))
                           #f
                           (let loop ((cs1 chars1)
                                      (cs2 chars2))
                             (if (empty? cs1)
                                 #t
                                 (let ((c1 (car cs1))
                                       (c2 (car cs2)))
                                   (if (not (equal? c1 c2))
                                       #f
                                       (loop (cdr cs1)
                                             (cdr cs2)))))))))
         (is-suffix? (lambda (chars1 chars2)
                       (is-prefix? (reverse chars1)
                                   (reverse chars2)))))
    (let loop ((comp (string->list (car words)))
               (tests (cdr words))
               (cnt 0))
      (if (empty? tests)
          cnt
          (loop (string->list (car tests))
                (cdr tests)
                (+ cnt (count
                        (lambda (test)
                          (and (is-prefix? comp (string->list test))
                               (is-suffix? comp (string->list test))))
                        tests)))))))

(count-prefix-suffix-pairs '("a" "aba" "ababa" "aa")) ; 4
(count-prefix-suffix-pairs '("pa" "papa" "ma" "mama")) ; 2
(count-prefix-suffix-pairs '("abab" "ab")) ; 0
(count-prefix-suffix-pairs '("a" "abb")) ; 0
