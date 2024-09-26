#lang racket

(provide word-count)

(define (word-count string)
  (let* ((words (filter-not
                 (lambda (word) (equal? "" word))
                 (regexp-split #rx"[ .,?!:&@%^$\t\n]" string)))
         (cleaned-words (map
                         (lambda (word)
                           (let ((word (string-downcase word))
                                 (chars (string->list word)))
                             (if (and (equal? #\' (first chars))
                                      (equal? #\' (last chars)))
                                 (substring
                                  word
                                  1
                                  (- (string-length word) 1))
                                 word)))
                         words)))
    (foldl
     (lambda (word counts)
       (if (hash-has-key? counts word)
           (hash-set! counts word (+ 1 (hash-ref counts word)))
           (hash-set! counts word 1))
       counts)
     (make-hash)
     cleaned-words)))
