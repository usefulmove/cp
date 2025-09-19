#lang racket

(define (repeated-substring-pattern s)
  (letrec ((n (string-length s))
           (check-repeat (lambda (sub str)
                           (let ((reduced (string-replace str sub "")))
                             (cond ((equal? reduced "") #t) ; fully reduced
                                   ((equal? reduced str) #f) ; doesn't reduce
                                   (else (check-repeat sub reduced)))))))
    (let loop ((sub-len 0))
      (if (> sub-len (/ n 2))
          #f
          (or (check-repeat (substring s 0 sub-len) s)
              (loop (+ sub-len 1)))))))

(repeated-substring-pattern "abab") ; => #t
(repeated-substring-pattern "aba") ; => #f
(repeated-substring-pattern "abcabcabcabc") ; => #t
