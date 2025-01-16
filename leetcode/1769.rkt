#lang racket

(define (min-operations boxes)
  (let* ((len (string-length boxes))
         (bs (string->list boxes))
         (get-ops (lambda (i)
                       (foldl
                        (lambda (j acc)
                          (+ acc (if (or (= i j)
                                         (equal? (list-ref bs j) #\0))
                                     0
                                     (abs (- i j)))))
                        0
                        (range len)))))
    (map
     (lambda (index) (get-ops index))
     (range len))))

(min-operations "110") ; => '(1 1 3)
(min-operations "001011") ; => '(11 8 5 4 3 4)
