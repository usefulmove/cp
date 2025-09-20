#lang racket

(define (str-str haystack needle)
  (let* ((n-haystack (string-length haystack))
         (n-needle (string-length needle))
         (needle-cs (string->list needle)))
    (let loop ((cs (string->list haystack))
               (index 0))
      (cond ((< (- n-haystack index) n-needle) -1)
            ((equal? (take cs n-needle) needle-cs) index)
            (else (loop (cdr cs)
                        (+ index 1)))))))

(str-str "sadbutsad" "sad") ; => 0
(str-str "leetcode" "leeto") ; => -1
