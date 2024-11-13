#lang racket

(define (is-subsequence s t)
  (let ((s-chars (string->list s))
        (t-chars (string->list t)))
    (let loop ((scs s-chars)
               (tcs t-chars))
      (cond ((empty? scs) #t) ; all characters were present (in order)
             (else (let* ((c (car scs))
                          (mbr (member c tcs)))
                     (if mbr ; if character is present in list ...
                         (loop (cdr scs) ; continue checking
                               (cdr mbr))
                         #f))))))) ; not subsequence

(define (is-subsequence s t)
  (let ((s-chars (string->list s))
        (t-chars (string->list t)))
    (let loop ((scs s-chars)
               (tcs t-chars))
      (cond ((empty? scs) #t)
            ((member (car scs) tcs) (loop (cdr scs)
                                          (cdr (member (car scs) tcs))))
            (else #f)))))

(is-subsequence "abc" "ahbgdc")
(is-subsequence "axc" "ahbgdc")
(is-subsequence "ace" "abcde")
(is-subsequence "aec" "abcde")
