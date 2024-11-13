#lang racket


(define (find-prefix-score nums)
  (let ((conversion-list (let loop ((lst nums)
                                     (max-so-far 0)
                                     (result '()))
                            (if (empty? lst)
                                (reverse result)
                                (let* ((current-num (car lst))
                                       (updated-max (max max-so-far current-num))
                                       (converted (+ current-num updated-max)))
                                  (loop
                                   (cdr lst)
                                   updated-max
                                   (cons converted result)))))))
    (let loop ((lst conversion-list)
               (sum-so-far 0)
               (result '()))
      (if (empty? lst)
          (reverse result)
          (let* ((updated-sum (+ sum-so-far (car lst))))
            (loop
             (cdr lst)
             updated-sum
             (cons updated-sum result)))))))


; using folds (slower)
(define (find-prefix-score nums)
  (let ((conversion-list (cdr (foldl
                                (lambda (num acc)
                                  (let* ((max-so-far (car acc))
                                         (prefixes (cdr acc))
                                         (new-max-so-far (max max-so-far num)))
                                    (cons new-max-so-far
                                          (append prefixes
                                                  (list (+ num new-max-so-far))))))
                                '(0 . ()) ; ( max-so-far . prefixes )
                                nums)))
        (scanl (lambda (proc lst)
                 (foldl
                  (lambda (val acc)
                    (append acc (list (proc val (last acc)))))
                  (list (first lst))
                  (rest lst)))))
    (scanl
     +
     conversion-list)))
