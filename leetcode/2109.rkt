#lang racket

(define (add-spaces s spaces)
  (let loop ((cs (string->list s))
             (output '())
             (index 0)
             (ss spaces))
    (if (empty? cs)
        (list->string (reverse output))
        (loop (cdr cs)
              (if (and (not (empty? ss))
                       (= index (car ss)))
                  (append (list (car cs) #\space)
                          output)
                  (cons (car cs) output))
              (+ index 1)
              (if (and (not (empty? ss))
                       (= index (car ss)))
                  (cdr ss)
                  ss)))))

(add-spaces "LeetcodeHelpsMeLearn" '(8 13 15)) ; => "Leetcode Helps Me Learn"
(add-spaces "spaces" (range 7)) ; => " s p a c e s"
