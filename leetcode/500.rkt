#lang racket

(define (find-words words)
  (let* ((get-row (lambda (c)
                    (cond ((string-contains?
                            "qwertyuiop"
                            (string-downcase (string c))) 1)
                          ((string-contains?
                            "asdfghjkl"
                            (string-downcase (string c))) 2)
                          (else 3))))
         (single-row? (lambda (word)
                        (let loop ((cs (string->list word))
                                   (output #t)
                                   (row 0))
                          (cond ((= row 0) (loop (cdr cs)
                                                 output
                                                 (get-row (car cs))))
                                ((empty? cs) output)
                                (else (loop (cdr cs)
                                            (and output
                                                 (= row (get-row (car cs))))
                                            row)))))))
    (filter single-row? words)))

(find-words '())
(find-words '("Hello" "Alaska" "Dad" "Peace"))
(find-words '("omk"))
(find-words '("adsdf" "sfd"))
