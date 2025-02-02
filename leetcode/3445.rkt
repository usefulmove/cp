#lang racket

; Maximum Difference Between Even and Odd Frequency II
(define (max-difference s k)
  (let ((maximum -999999999))
    (for ((i (range (+ (- (string-length s) k) 1))))
      (for ((j (range (+ i k) (+ (string-length s) 1))))
        (let* ((sub (substring s i j))
               (sub-diff (difference sub)))
          (set! maximum (max sub-diff maximum)))))
    maximum))

(define (difference s)
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
         (odds (filter odd? counts))
         (evens (filter even? counts)))
    (if (or (empty? odds)
            (empty? evens))
        -999999999
        (- (apply max odds)
           (apply min evens)))))

(max-difference "12233" 4)
(max-difference "1122211" 3)
(max-difference "110" 3)
