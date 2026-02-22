#lang racket

(define (isogram? s)
  (let ((characters (map
                     char-downcase
                     (filter char-alphabetic? (string->list s)))))
    (= (length characters)
       (length (remove-duplicates characters)))))

(isogram? "lumberjacks")
(isogram? "background")
(isogram? "downstream")
(isogram? "six-year-old")
(isogram? "Alphabet")
