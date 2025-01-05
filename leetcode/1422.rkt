#lang racket

(define (max-score s)
  (let ((chars (string->list s))
        (left (lambda (lst n)
                (take lst n)))
        (right (lambda (lst n)
                 (drop lst n)))
        (zeros (lambda (lst)
                 (count
                  (lambda (c)
                    (equal? c #\0))
                  lst)))
        (ones (lambda (lst)
                (count
                 (lambda (c)
                   (equal? c #\1))
                 lst))))
    (let loop ((ind 1)
               (max-so-far 0))
      (if (= ind (length chars))
          max-so-far
          (let ((score (+ (zeros (left chars ind))
                          (ones (right chars ind)))))
            (loop (+ ind 1)
                  (if (> score max-so-far)
                      score
                      max-so-far)))))))

(max-score "011101") ; => 5
(max-score "00111") ; => 5
(max-score "1111") ; => 3
