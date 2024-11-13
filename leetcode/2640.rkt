#lang racket


(define (find-prefix-score nums)
  (let ((conversion-array (let loop ((lst nums)
                                     (max-so-far 0)
                                     (result '()))
                            (if (empty? lst)
                                (reverse result)
                                (let* ((current-num (car lst))
                                       (new-max (max max-so-far current-num))
                                       (converted (+ current-num new-max)))
                                  (loop
                                   (cdr lst)
                                   new-max
                                   (cons converted result)))))))
    (let loop ((lst conversion-array)
               (sum-so-far 0)
               (result '()))
      (if (empty? lst)
          (reverse result)
          (let* ((n (car lst))
                 (update (+ n sum-so-far)))
            (loop
             (cdr lst)
             update
             (cons update result)))))))


(define (find-prefix-score nums)
  (let ((conversion-array (cdr (foldl
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
     conversion-array)))
