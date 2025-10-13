#lang racket

(define (remove-anagrams words)
  (let* ((f-char-sort (lambda (ca cb)
                        (< (char->integer ca)
                           (char->integer cb))))
         (anagrams? (lambda (word_a word_b)
                      (equal? (sort (string->list word_a) f-char-sort)
                              (sort (string->list word_b) f-char-sort)))))
    (let loop ((ws words)
               (acc '()))
      (if (empty? (cdr ws))
          (reverse (cons (car ws) acc))
          (let ((w_a (car ws))
                (w_b (cadr ws)))
            (if (anagrams? w_a w_b)
                (loop (cons w_a (cddr ws))
                      acc)
                (loop (cdr ws)
                      (cons w_a acc))))))))

(remove-anagrams '("abba" "baba" "bbaa" "cd" "cd")) ; => '("abba" "cd" 
(remove-anagrams '("a" "b" "c" "d" "e")) ; => '("a" "b" "c" "d" "e")
