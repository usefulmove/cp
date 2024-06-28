#lang racket

(define (sum-of-encrypted-int nums)
  (let ((convert (lambda (num) ; int -> int
                   (let* ((char->ord (lambda (c) ; char -> int
                                       (- (char->integer c)
                                          (char->integer #\0))))
                          (digits (map ; [int]
                                   char->ord
                                   (string->list (number->string num))))
                          (out-digits (make-list ; [int]
                                       (length digits)
                                       (apply max digits)))
                          (ord->char (lambda (ord) ; int -> char
                                       (integer->char
                                        (+ ord
                                           (char->integer #\0))))))
                     (string->number
                      (list->string
                       (map ord->char out-digits)))))))
    (foldl
     (lambda (num acc)
       (+ acc
          (if (< num 10)
              num
              (convert num))))
     0
     nums)))

;; test cases
(sum-of-encrypted-int '(1 2 3))
(sum-of-encrypted-int '(10 21 31))
