#lang racket

(define (max-freq-sum s)
  (let* ((chars (string->list s))
         (vowel? (lambda (c) (member c '(#\a #\e #\i #\o #\u))))
         (counter (lambda (lst)
                    (let loop ((cs chars)
                               (out '())) ; assoc list
                      (displayln out)
                      (if (empty? cs)
                          (reverse out)
                          (let* ((c (car cs))
                                 (ind (index-of (map car out) c)))
                            (loop (cdr cs)
                                  (if ind
                                      (append (take out ind)
                                              (list (cons c (add1 (cdr (list-ref out ind)))))
                                              (drop out (add1 ind)))
                                      (cons (cons c 1) out))))))))
         (counts (counter chars)))
    counts))

(max-freq-sum "successes")
(max-freq-sum "aeiaeia")
