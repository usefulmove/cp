(define (any? f lst)
  (cond ((null? lst) #f)
        ((f (car lst)) #t)
        (else (any? f (cdr lst)))))


(define (zip . lsts)
  (cond ((null? lsts) '())
        ((any? identity (map null? lsts)) '())
        (else (cons (map car lsts)
                    (apply zip (map cdr lsts)))))) 


(define (sort-jumbled mapping nums)
  (let* ((map-number (lambda (num) ; int -> int
                       (let* ((char->digit (lambda (c)
                                             (- (char->integer c)
                                                (char->integer #\0))))
                              (number->digits (lambda (num)
                                                (let ((chars (string->list (number->string num))))
                                                  (map char->digit chars))))
                              (digits->number (lambda (digits)
                                                (let ((enumerated-digits (zip
                                                                          (range (length digits)) ; index
                                                                          (reverse digits)))) ; digit
                                                  (foldl
                                                   (lambda (pair acc)
                                                     (let ((index (car pair))
                                                           (digit (cadr pair)))
                                                       (+ acc (* digit (expt 10 index)))))
                                                   0
                                                   enumerated-digits))))
                              (digits (number->digits num))
                              (mapped-digits (map
                                              (lambda (digit)
                                                (list-ref mapping digit))
                                              digits)))
                         (digits->number mapped-digits))))
         (mapped-nums (map map-number nums))
         (map-pairs (zip nums mapped-nums))
         (sorted-pairs (sort ; sort map pairs by mapped nums
                        map-pairs
                        (lambda (pair-a pair-b)
                          (< (cadr pair-a)
                             (cadr pair-b))))))
    (map car sorted-pairs)))
