#lang racket

(define (max-freq-sum s)
  (let* ((chars (string->list s))
         (vowel? (lambda (c) (member c '(#\a #\e #\i #\o #\u))))
         (counts (let loop ((cs chars)
                            (cnts '())) ; assoc list
                   (if (empty? cs)
                       (reverse cnts)
                       (let* ((c (car cs))
                              (ind (index-of (map car cnts) c)))
                         (loop (cdr cs)
                               (if ind
                                   (append (take cnts ind)
                                           (let ((c-cnt (cdr
                                                         (list-ref cnts ind))))
                                             (list (cons c (+ c-cnt 1))))
                                           (drop cnts (+ ind 1)))
                                   (cons (cons c 1) cnts))))))))
    (let loop ((cnts counts)
               (max-vowel 0)
               (max-consonant 0))
      (cond ((empty? cnts) (+ max-vowel max-consonant))
            ((vowel? (caar cnts)) (loop (cdr cnts) ; vowel
                                        (max max-vowel (cdar cnts))
                                        max-consonant))
            (else (loop (cdr cnts) ; consonant
                        max-vowel
                        (max max-consonant (cdar cnts))))))))

(max-freq-sum "successes") ; => 6
(max-freq-sum "aeiaeia") ; => 3
