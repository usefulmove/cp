#lang racket

(define (prefix-count words pref)
  (count
   (lambda (word)
     (string-prefix? word pref))
   words))

(prefix-count '("pay" "attention" "practice" "attend") "at") ; => 2
(prefix-count '("leetcode" "win" "loops" "success") "code") ; => 0
