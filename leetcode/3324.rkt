#lang racket

(define (string-sequence target)
  (let ((next-c (lambda (c)
                 (integer->char (+ (char->integer c) 1)))))
    (let loop ((cs (string->list target))
               (output '())
               (add-depth 1))
      (cond
        ;; base case - convert accumulated character lists to strings
        ((empty? cs) (map
                      (lambda (lst)
                        (apply string (reverse lst)))
                      (reverse (cdr output))))

        ;; initialize output with '((#\a))
        ((empty? output) (loop cs
                               (cons (list #\a) output)
                               add-depth))

        ;; extend output to required depth
        ((< (length (car output))
            add-depth)            (loop cs
                                        (cons (cons #\a (car output)) output)
                                        (+ add-depth 1)))

        ;; match target character - extend depth and reset to #\a
        ((equal? (car cs)
                 (caar output)) (loop (cdr cs)
                                           (cons (cons #\a (car output)) output)
                                           (+ add-depth 1)))

        ;; increment leading character
        (else (loop cs
                    (cons (cons (next-c (caar output))
                                (cdar output))
                          output)
                    add-depth))))))

;; examples
#;(string-sequence "ab") ; => ("a" "aa" "ab")
#;(string-sequence "abc") ; => ("a" "aa" "ab" "aba" "abb" "abc")
#;(string-sequence "aaaaaaaaaa")
  ; => '("a" "aa" "aaa" "aaaa" "aaaaa" "aaaaaa" "aaaaaaa" "aaaaaaaa" "aaaaaaaaa" "aaaaaaaaaa")
#;(string-sequence "he")
  ; => ("a" "b" "c" "d" "e" "f" "g" "h" "ha" "hb" "hc" "hd" "he")
