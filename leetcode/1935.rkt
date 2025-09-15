#lang racket

(define (can-be-typed-words text brokenLetters)
  (let ((broken-letters (string->list brokenLetters)))
    (count
     (lambda (word)
       (let loop ((cs (string->list word)))
         (if (empty? cs)
             #t
             (and (not (member (car cs) broken-letters))
                  (loop (cdr cs))))))
     (string-split text))))

(can-be-typed-words "hello world" "ad") ; => 1
(can-be-typed-words "leet code" "lt") ; => 1
(can-be-typed-words "leet code" "e") ; => 0
