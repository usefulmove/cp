#lang racket

(define (does-alice-win s)
  (let ((vowel? (lambda (c)
                  (member (char-downcase c) '(#\a #\e #\i #\o #\u)))))
    (let loop ((cs (string->list s)))
      (cond ((empty? cs) #f)
            ((vowel? (car cs)) #t)
            (else (loop (cdr cs)))))))

;(define (does-alice-win s) # too slow
;  (let ((vowel? (lambda (c)
;                  (member (char-downcase c) '(#\a #\e #\i #\o #\u)))))
;    (let loop ((str s))
;      (cond ((equal? str "") #f)
;            ((vowel? (string-ref str 0)) #t)
;            (else (loop (substring str 1)))))))

;(define (does-alice-win s) # doesn't shortcut on first vowel instance
;  (let* ((vowel? (lambda (c)
;                   (member (char-downcase c) '(#\a #\e #\i #\o #\u))))
;         (vowels (count vowel? (string->list s))))
;    (not (zero? vowels))))

(does-alice-win "leetcoder")
(does-alice-win "bbcd")
