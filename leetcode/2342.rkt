#lang racket

(define (maximum-sum nums)
  (let* ((max-so-far 0)
         (num-sum-pairs (map
                         (lambda (n)
                           (cons n (sum-digits n)))
                         nums))
         (nspairs-reduced (let ((counts (make-hash)))
                            (for ((pair num-sum-pairs))
                              (hash-update! counts (cdr pair) add1 0))
                            (filter
                             (lambda (pair)
                               (> (hash-ref counts (cdr pair)) 1))
                             num-sum-pairs)))
         (cnt (length nspairs-reduced)))
    (if (empty? nspairs-reduced)
        -1
        (begin
         (for ((i (range (- cnt 1))))
           (for ((j (range (+ i 1) cnt)))
             (let* ((pair-a (list-ref nspairs-reduced i))
                    (pair-b (list-ref nspairs-reduced j))
                    (sum (+ (car pair-a) (car pair-b))))
               (when (and (= (cdr pair-a)
                             (cdr pair-b))
                          (> sum max-so-far))
                 (set! max-so-far sum)))))
         max-so-far))))

(define (sum-digits n)
  (let loop ((n (abs n)) (sum 0))
    (if (zero? n)
        sum
        (loop (quotient n 10) (+ sum (remainder n 10))))))


(maximum-sum '(18 43 36 13 7))
(maximum-sum '(10 12 19 14))
