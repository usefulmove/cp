#lang racket

(define (string-sequence target)
  (let ((next-c (lambda (c)
                 (integer->char (+ (char->integer c) 1)))))
    (let loop ((cs (string->list target))
               (output '())
               (add-depth 1))
      (if (empty? cs)
          (map
           (lambda (lst)
             (apply string (reverse lst)))
           (reverse (cdr output)))
          (let ((c-to-match (car cs)))
            (if (empty? output)
                (loop cs
                      (cons (list #\a) output)
                      add-depth)
                (let ((output-head (car output)))
                  (if (< (length output-head)
                         add-depth)
                      (loop cs
                            (cons (cons #\a output-head) output)
                            (+ add-depth 1))
                      (let ((curr-c (car output-head)))
                        (if (equal? curr-c c-to-match)
                            (loop (cdr cs)
                                  (cons (cons #\a output-head) output)
                                  (+ add-depth 1))
                            (loop cs
                                  (cons (cons (next-c curr-c) (cdr output-head))
                                        output)
                                  add-depth)))))))))))

#;(string-sequence "ab") ; ("a" "aa" "ab")
#;(string-sequence "abc") ; ("a" "aa" "ab" "aba" "abb" "abc")
#;(string-sequence "aaaaaaaaaa")
  ; '("a" "aa" "aaa" "aaaa" "aaaaa" "aaaaaa" "aaaaaaa" "aaaaaaaa" "aaaaaaaaa" "aaaaaaaaaa")
