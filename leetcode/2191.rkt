(define (sort-jumbled mapping nums)
  (let ((convert-num (lambda (num)
                       (map
                        (lambda (c)
                          (let ((digit (- (char->integer c)
                                          (char->integer #\0))))
                            (list-ref mapping digit)))
                        (string->list (number->string num))))))
    (map car (sort
              (zip
               nums
               (map convert-num nums))
              (lambda (pair-1 pair-2)
                (< (cadr pair-1) (cadr pair-2)))))))
