#lang racket

(define (is-prefix-of-word sentence search-word)
  (let loop ((words (string-split sentence))
             (index 1))
    (cond ((empty? words) -1)
          ((string-prefix? (car words) search-word) index)
          (else (loop (cdr words)
                      (+ index 1))))))

(is-prefix-of-word "i love eating burger" "burg") ; => 4
(is-prefix-of-word "this problem is an easy problem" "pro") ; => 2
(is-prefix-of-word "i am tired" "you") ; => -1
