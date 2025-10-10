#lang racket

(define (validate-coupons code business-line is-active)
  (let* ((code-valid? (lambda (code)
                        (and (not (equal? "" code))
                             (let loop ((cs (string->list code))
                                        (out #t))
                               (if (empty? cs)
                                   out
                                   (loop (cdr cs)
                                         (and out (or (char-numeric? (car cs))
                                                      (char-alphabetic? (car cs))
                                                      (equal? #\_ (car cs))))))))))
         (valid-businesses '("electronics" "grocery"
                             "pharmacy" "restaurant"))
         (business-valid? (lambda (business)
                            (member business valid-businesses)))
         (valid-inds (filter
                      (lambda (i)
                        (and (code-valid? (list-ref code i))
                             (business-valid? (list-ref business-line i))
                             (list-ref is-active i)))
                      (range (length code))))
         (valid-pairs (map
                       (lambda (i) (cons (list-ref code i)
                                         (list-ref business-line i)))
                       valid-inds)))
    (map car (sort
              valid-pairs
              (lambda (pair-a pair-b)
                (let ((code-a (car pair-a))
                      (code-b (car pair-b))
                      (business-a (cdr pair-a))
                      (business-b (cdr pair-b)))
                  (if (equal? business-a business-b)
                      (string<? code-a code-b)
                      (> (length (member business-a valid-businesses))
                         (length (member business-b valid-businesses))))))))))


(validate-coupons '("SAVE20" "" "PHARMA5" "SAVE@20")
                  '("restaurant" "grocery" "pharmacy" "restaurant")
                  '(#t #t #t #t))
