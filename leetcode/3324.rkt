#lang racket

(define (string-sequence target)
  (let ((next-char (lambda (c) (integer->char
                                (+ (char->integer c) 1)))))
    (let loop ((cs (string->list target))
               (output '())
               (depth 1))
      (println cs)
      (println output)
      (println depth)
      (if (empty? cs)
          (reverse output)
          (let ((char-to-match (car cs)))
            (if (empty? output)
                (loop cs
                      (cons (list #\`) output))
                (let ((output-head (car output)))
                  (if (equal? (car output-head) char-to-match)
                      (loop (cdr cs)
                            (cons (cons #\` (cdr output))
                                  output))
                      (loop cs
                            (cons (cons (next-char (car output-head))
                                        (cdr output-head))
                                  output))))))))))

(string-sequence "ab") ; ("a" "aa" "ab")
#;(string-sequence "abc") ; ("a" "aa" "ab" "aba" "abb" "abc")
