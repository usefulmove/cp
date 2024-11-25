#lang racket

(define (string-sequence target)
  (let ((next-char (lambda (c) (integer->char
                                (+ (char->integer c) 1)))))
    (let loop ((cs (string->list target))
               (output '())
               (add-depth 1))
      (println cs)
      (println output)
      (println add-depth)
      (if (empty? cs)
          (reverse output)
          (let ((char-to-match (car cs)))
            (if (empty? output)
                (loop cs
                      (cons (list #a`) output)
                      add-depth)
                (let ((output-head (car output)))
                  (if (<= (length (car output))
                          add-depth)
                      (loop todo
                            todo
                            todo)
                      (loop cs
                            (cons (cons #\a output-head) output)
                            (+ add-depth 1))))))))))

(string-sequence "ab") ; ("a" "aa" "ab")
#;(string-sequence "abc") ; ("a" "aa" "ab" "aba" "abb" "abc")
