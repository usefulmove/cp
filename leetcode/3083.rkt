#lang racket

(define (is-substring-present s)
  (let ((revs (list->string (reverse (string->list s))))
        (exists? false))
    (for ((i (range (string-length s))))
      (for ((j (range (add1 i) (add1 (string-length s)))))
        (let ((substr (substring s i j)))
          (if (and (>= (string-length substr) 2)
                   (string-contains? s substr)
                   (string-contains? revs substr))
              (set! exists? true)
            (void)))))
    exists?))

(is-substring-present "leetcode")
(is-substring-present "abcba")
(is-substring-present "abcd")
