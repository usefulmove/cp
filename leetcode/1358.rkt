#lang racket

(define (number-of-substrings s)
  (let* ((cs (string->list s))
         (len (length cs))
         (sublist (lambda (as i j)
                    (drop (take as j) i)))
         (contains-all? (lambda (as)
                          (foldl
                           (lambda (c acc)
                             (and acc (member c as)))
                           #t
                           '(#\a #\b #\c))))
         (cnt 0))
    (for ((i (range len)))
      (for ((j (range (+ i 3) (add1 len))))
        (let ((sub (sublist cs i j)))
          (when (contains-all? sub)
            (set! cnt (add1 cnt))))))
    cnt))

(number-of-substrings "abcabc") ; => 10
(number-of-substrings "aaacb") ; => 3
(number-of-substrings "abc") ; => 1
