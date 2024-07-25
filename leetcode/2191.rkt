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
  (let* ((map-num (lambda (num)
                    (let ((digits (map
                                   (lambda (c)
                                     (- (char->integer c)
                                        (char->integer #\0)))
                                   (string->list (number->string num)))))
                      (foldl
                       (lambda (pair acc)
                         (let ((index (car pair))
                               (converted-digit (cadr pair)))
                           (+ acc (* converted-digit (expt 10 index)))))
                       0
                       (zip
                        (range (length digits))
                        (reverse (map
                                  (lambda (digit)
                                    (list-ref mapping digit))
                                  digits)))))))
         (mapped-nums (map map-num nums))
         (map-pairs (zip nums mapped-nums))
         (sorted-pairs (sort ; sort map pairs by mapped nums
                        map-pairs
                        (lambda (pair-a pair-b)
                          (< (cadr pair-a)
                             (cadr pair-b))))))
    (map car sorted-pairs)))
