#lang racket

(define (count-vowel-substrings word)
  (let* ((cnt 0)
         (cs (string->list word))
         (len (length cs))
         (sublist (lambda (as start end)
                    (drop (take as end) start)))
         (vowels '(#\a #\e #\i #\o #\u))
         (contains-every-vowel? (lambda (as)
                                  (foldl
                                   (lambda (vowel acc)
                                     (and acc (member vowel as)))
                                   #t
                                   vowels)))
         (contains-only-vowels? (lambda (as)
                                  (foldl
                                   (lambda (a acc)
                                     (and acc (member a vowels)))
                                   #t
                                   as))))
    (for ((i (range len)))
      (for ((j (range (+ i 5) (add1 len))))
        (let ((sub (sublist cs i j)))
          (when (and (contains-every-vowel? sub)
                     (contains-only-vowels? sub))
            (set! cnt (add1 cnt))))))
    cnt))

(count-vowel-substrings "aeiouu") ; => 2
(count-vowel-substrings "unicornarihan") ; => 0
(count-vowel-substrings "cuaieuouac") ; => 7
