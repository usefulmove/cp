#lang racket

(define (word-subsets words1 words2)
  (letrec ((is-member? (lambda (a b)
                         (not (equal? #f (member a b)))))
           (is-subset? (lambda (possibles comparisons)
                         (if (empty? possibles)
                             #t
                             (let ((possible (car possibles)))
                               (and (is-member? possible comparisons)
                                    (is-subset? (remove possible possibles) (remove possible comparisons)))))))
           (is-subset-word? (lambda (possibles-word comparison-word)
                              (is-subset? (string->list possibles-word)
                                          (string->list comparison-word))))
           (is-universal? (lambda (word)
                            (let loop ((words words2)
                                       (result #t))
                              (if (empty? words)
                                  result
                                  (loop (cdr words)
                                        (and result
                                             (is-subset-word? (car words) word))))))))
    (filter is-universal? words1)))

(word-subsets '("amazon" "apple" "facebook" "google" "leetcode") '("e" "o"))
(word-subsets '("amazon" "apple" "facebook" "google" "leetcode") '("l" "e"))
