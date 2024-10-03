#lang racket

(define (array-rank-transform vals)
  (let* ((value-rank-assoc (foldl ; rank assoc :: [int . int]
                            (lambda (val acc-so-far)
                              (let ((rv-acc-so-far (map
                                                    (lambda (pair)
                                                      (cons (cdr pair) (car pair)))
                                                    acc-so-far)))
                                (cond ((null? acc-so-far) (list (cons val 1)))
                                      ((assoc val acc-so-far) acc-so-far)
                                      (else ; add val
                                       #;(print "acc: ")
                                       #;(print "adding ")
                                       #;(print val)
                                       #;(print " to ")
                                       #;(println acc-so-far)
                                       #;(println (range 1 (+ 2 (length acc-so-far))))
                                       (map ; map from rank to value using rank assoc
                                        (lambda (rank)
                                          (let ((value-for-rank-pair? (assoc rank rv-acc-so-far)))
                                            ; is there a value associated with this rank?
                                            (if value-for-rank-pair? ; value exists?
                                                (let ((value-for-rank (cdr value-for-rank-pair?)))
                                                  (cons value-for-rank
                                                        (if (< value-for-rank val)
                                                            rank
                                                            (+ 1 rank))))
                                                (let* ((ranked-values (map car acc-so-far))
                                                       (new-rank (+ 1 (count
                                                                       (lambda (n) (< n val))
                                                                       ranked-values))))
                                                  (cons val new-rank)))))
                                        (range 1 (+ 2 (length acc-so-far))))))))
                            '() ; value-rank assoc accumulator [value . rank] :: [int . int]
                            vals))
         (value->rank (lambda (value) ; :: (int -> int)
                        (cdr (assoc value value-rank-assoc)))))
    ;(println vals)
    ;(println value-rank-assoc)
    (map
     value->rank
     vals)))

#;(array-rank-transform '(100 100 100))
#;(array-rank-transform '(100 200 300))
#;(array-rank-transform '(400 100 300 200))
#;(array-rank-transform '(37 12 28 9 100 56 80 5 12))
