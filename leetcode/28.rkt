#lang racket

(define (str-str haystack needle)
  (let* ((haystack-cs (string->list haystack))
         (needle-cs (string->list needle))
         (len (length needle-cs)))
    (let loop ((cs haystack-cs)
               (index 0))
      (cond ((or (empty? cs)
                 (< (length cs) len)) -1)
            ((equal? (take cs len) needle-cs) index)
            (else (loop (cdr cs)
                        (+ index 1)))))))

(str-str "sadbutsad" "sad") ; => 0
(str-str "leetcode" "leeto") ; => -1
