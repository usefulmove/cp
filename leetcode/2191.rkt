(define (sort-jumbled mapping nums)
  (let ((convert-num (lambda (num)
                       todo)))
    (map car (sort
              (zip
               nums
               (map convert-num nums))
              (lambda (pair-1 pair-2)
                (< (cadr pair-1) (cadr pair-2)))))))


#;(list-ref mapping i)
