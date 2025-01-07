#lang racket

(define (string-matching words)
  (filter
   (lambda (word)
     (let loop ((ws words)
                (res #f))
       (if (empty? ws)
           res
           (let ((w (car ws)))
             (loop (cdr ws)
                   (or res (and (not (equal? w word))
                                (string-contains? w word))))))))
   words))

(string-matching '("mass" "as" "hero" "superhero"))
(string-matching '("leetcode" "et" "code"))
(string-matching '("blue" "green" "bu"))
