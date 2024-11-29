#lang racket

(define (modified-matrix matrix)
  (let* ((transpose (lambda (m)
                      (apply map
                             list
                             m)))
         (answer-trans (map
                        (lambda (lst)
                          (let ((maximum (apply max lst)))
                            (map
                             (lambda (e)
                               (if (= e -1)
                                   maximum
                                   e))
                             lst)))
                        (transpose matrix))))
    (transpose answer-trans)))

(modified-matrix '((1 2 -1) (4 -1 6) (7 8 9)))
