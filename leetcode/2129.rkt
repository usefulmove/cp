#lang racket

(define (capitalize-title title)
  (string-trim 
   (foldl
    (lambda (word acc)
      (let ((lowercased (string-downcase word)))
        (string-append acc
                       " "
                       (if (< (string-length lowercased) 3)
                           lowercased
                           (string-titlecase lowercased)))))
    ""
    (string-split title))))

(capitalize-title "capiTalIze tHe titLe")
(capitalize-title "capiTalIze tHe titLe")
