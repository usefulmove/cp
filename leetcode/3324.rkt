#lang racket

(define (string-sequence target)
  (let (next-char (lambda (c) (integer->char
                               (+ (char->integer c) 1))))
    (let loop ((cs (string->list target))
               (output '()))
      (if (empty? cs)
          (reverse output)
          (let ((char-to-match (car cs)))
            (if (empty? output-head)
                (loop cs
                      (cons (list #\`) output))
                (let (todo todo)
                  todo)))))))

(string-sequence "abc") ; ("a" "aa" "ab" "aba" "abb" "abc")
