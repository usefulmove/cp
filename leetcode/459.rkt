#lang racket

(define (repeated-substring-pattern s)
  (string-contains?
   (substring (string-append s s) 1 (- (* (string-length s) 2) 1))
   s))

#;(define (repeated-substring-pattern s)
  (letrec ((half-n (/ (string-length s) 2))
           (repeats? (lambda (sub str)
                           (let ((reduced (string-replace str sub "")))
                             (cond ((equal? reduced "") #t) ; comp. reduced
                                   ((equal? reduced str) #f) ; doesn't reduce
                                   (else (repeats? sub reduced)))))))
    (let loop ((sub-len 0))
      (if (> sub-len half-n)
          #f
          (or (repeats? (substring s 0 sub-len) s)
              (loop (+ sub-len 1)))))))

(repeated-substring-pattern "abab") ; => #t
(repeated-substring-pattern "aba") ; => #f
(repeated-substring-pattern "abcabcabcabc") ; => #t
