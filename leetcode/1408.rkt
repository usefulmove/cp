#lang racket

(define (string-matching words)
  (filter
   (lambda (word)
     (let loop ((comps words)
                (result #f))
       (if (empty? comps)
           result
           (let ((comparison (car comps)))
             (loop (cdr comps)
                   (or result (and (not (equal? comparison word))
                                (string-contains? comparison word))))))))
   words))

(string-matching '("mass" "as" "hero" "superhero"))
(string-matching '("leetcode" "et" "code"))
(string-matching '("blue" "green" "bu"))
