#lang racket

#|
Search for the last odd character, and return the string from the first
character to that (last odd) character.
|#

#;(require srfi/13)
#;(define (largest-odd-number num)
  (let* ((cs (string->list num))
         (odds (indexes-where (map char->integer cs) odd?)))
    (if (empty? odds)
        ""
        (string-take cs (add1 (last odds))))))

(define (largest-odd-number num)
  (let loop ((cs (reverse (string->list num))))
    (cond ((empty? cs) "")
          ((odd? (char->integer (car cs))) (list->string (reverse cs)))
          (else (loop (cdr cs))))))

(largest-odd-number "52")
(largest-odd-number "4206")
(largest-odd-number "35427")
