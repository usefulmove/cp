#lang racket

; Maximum Difference Between Even and Odd Frequency I
(define (max-difference s)
  (let* ((count-pairs (foldl
                       (lambda (c cnts-so-far)
                         (let ((count-pair (assoc c cnts-so-far)))
                           (if count-pair
                               (cons (cons c (+ (cdr count-pair) 1))
                                     (remove count-pair cnts-so-far))
                               (cons (cons c 1)
                                     cnts-so-far))))
                       '()
                       (string->list s)))
         (counts (map cdr count-pairs))
         (max-odd (apply max (filter odd? counts)))
         (min-even (apply min (filter even? counts))))
    (- max-odd min-even)))

(max-difference "aaaaabbc")
(max-difference "abcabcab")
