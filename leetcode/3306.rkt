#lang racket

(define (count-of-substrings word k)
  (let* ((cnt 0)
         (cs (string->list word))
         (len (length cs))
         (sublist (lambda (as start end)
                    (drop (take as end) start)))
         (vowels '(#\a #\e #\i #\o #\u))
         (contains-every-vowel? (lambda (bs)
                                  (foldl
                                   (lambda (vowel acc)
                                     (and acc (member vowel bs)))
                                   #t
                                   vowels))))
    (for ((i (range len)))
      (for ((j (range (+ i k 5) (add1 len))))
        (let ((sub (sublist cs i j)))
          (when (and (contains-every-vowel? sub)
                     (= k (count
                           (lambda (c) (not (member c vowels)))
                           sub)))
            (set! cnt (add1 cnt))))))
    cnt))

(count-of-substrings "aeioqq" 1)
(count-of-substrings "aeiou" 0)
(count-of-substrings "ieaouqqieaouqq" 1)
