; Create an association list of the numbers and their mapped values and sort by
; the mapped values. Remove the mapped values and return the numbers in the
; updated order.

(define (sort-jumbled mapping nums)
  (let* ((map-number (lambda (num) ; int -> int
                       (let* ((char->digit (lambda (c)
                                             (- (char->integer c)
                                                (char->integer #\0))))
                              (digit->char (lambda (digit)
                                             (integer->char
                                              (+ digit
                                                 (char->integer #\0)))))
                              (number->digits (lambda (num)
                                                (map
                                                 char->digit
                                                 (string->list
                                                   (number->string num)))))
                              (digits->number (lambda (digits)
                                                (string->number
                                                 (list->string
                                                  (map digit->char digits)))))
                              (digits (number->digits num))
                              (mapped-digits (map
                                              (lambda (digit)
                                                (list-ref mapping digit))
                                              digits)))
                         (digits->number mapped-digits))))
         (map-pairs (map cons nums
                              (map map-number nums)))
         (sorted-pairs (sort ; sort map pairs by mapped nums
                        map-pairs
                        (lambda (pair-a pair-b)
                          (< (cdr pair-a)
                             (cdr pair-b))))))
    (map car sorted-pairs)))
