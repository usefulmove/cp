#lang racket

(define (sort-vowels s)
  (let* ((chars (string->list s))
         (vowel? (lambda (c)
                   (member (char-downcase c) '(#\a #\e #\i #\o #\u))))
         (sorted-vowels (sort
                         (filter vowel? chars)
                         (lambda (a b) (< (char->integer a)
                                          (char->integer b))))))
    (let loop ((cs chars)
               (vs sorted-vowels)
               (out '()))
      (cond ((empty? cs) (list->string (reverse out)))
            ((vowel? (car cs)) (loop (cdr cs)
                                     (cdr vs)
                                     (cons (car vs) out)))
            (else (loop (cdr cs)
                        vs
                        (cons (car cs) out)))))))

(sort-vowels "lEetcOde") ; => "lEOtcede"
(sort-vowels "lYmpH") ; => "lYmpH"
