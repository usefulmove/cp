#lang racket

(define (sq-in-rect length width)
  (if (= length width)
      '()
      (letrec ((solve (lambda (len wid)
                        (let ((small (min len wid))
                              (large (max len wid)))
                          (if (= small large)
                              (list small) ; final square
                              (cons small
                                    (solve small (- large small))))))))
        (solve length width))))
