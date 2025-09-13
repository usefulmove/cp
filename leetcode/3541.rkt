#lang racket

(define (max-freq-sum s)
  (let* ((chars (string->list s))
         (vowel? (lambda (c) (member c '(#\a #\e #\i #\o #\u))))
         (counter (lambda (lst)
                    (let loop ((cs chars)
                               (out '())) ; assoc list
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
    (let loop ((cnts counts)
               (max-vowel 0)
               (max-consonant 0))
      (cond ((empty? cnts) (+ max-vowel max-consonant))
            ((vowel? (caar cnts)) (loop (cdr cnts)
                                        (max max-vowel (cdar cnts))
                                        max-consonant))
            (else (loop (cdr cnts)
                        max-vowel
                        (max max-consonant (cdar cnts))))))))

(max-freq-sum "successes") ; => 6
(max-freq-sum "aeiaeia") ; => 3
