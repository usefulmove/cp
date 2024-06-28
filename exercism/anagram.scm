(import (rnrs))

(define (anagram target words)
  (filter
   (lambda (word)
     (let ((normalise (lambda (word)
                        (sort char<? (map
                                      char-downcase
                                      (string->list word))))))
       (and (not (equal? (string-downcase target)
                         (string-downcase word)))
            (equal? (normalise target)
                    (normalise word)))))
   words))
