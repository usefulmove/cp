#lang racket

#|
Iterate through the list and check the first two words. If they are anagrams, remove the second and re-enter the iteration. If not, add the first to the accumulator and continue iterating through the rest. When you have reached the last word, add it to the accumulator and return the list of accumulated words.
|#

(define (remove-anagrams words)
  (let* ((f-csort (lambda (c_a c_b)
                        (< (char->integer c_a)
                           (char->integer c_b))))
         (anagrams? (lambda (word_a word_b)
                      (equal? (sort (string->list word_a) f-csort)
                              (sort (string->list word_b) f-csort)))))
    (let loop ((ws words) (acc '()))
      (if (empty? (cdr ws))
          (reverse (cons (car ws) acc))
          (let ((w_a (car ws))
                (w_b (cadr ws)))
            (if (anagrams? w_a w_b)
                (loop (cons w_a (cddr ws))
                      acc)
                (loop (cdr ws)
                      (cons w_a acc))))))))

(remove-anagrams '("abba" "baba" "bbaa" "cd" "cd")) ; => '("abba" "cd")
(remove-anagrams '("a" "b" "c" "d" "e")) ; => '("a" "b" "c" "d" "e")
