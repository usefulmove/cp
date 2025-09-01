#lang racket

(define (max-average-ratio classes extra-students)
  (let ((add-benefit (lambda (class)
                       (- (/ (add1 (car class))
                             (add1 (cadr class)))
                          (/ (car class)
                             (cadr class))))))
    (if (zero? extra-students)
        (exact->inexact (/ (apply + (map
                                     (lambda (class)
                                       (/ (car class)
                                          (cadr class)))
                                     classes))
                           (length classes)))
        (let ((sorted-classes (sort
                               classes
                               (lambda (class-a class-b)
                                 (> (add-benefit class-a)
                                    (add-benefit class-b))))))
          (max-average-ratio
           (cons (list (add1 (car (car sorted-classes)))
                       (add1 (cadr (car sorted-classes))))
                 (cdr sorted-classes))
           (sub1 extra-students))))))

(max-average-ratio '((1 2) (3 5) (2 2)) 0) ; => 0. 7
(max-average-ratio '((1 2) (3 5) (2 2)) 2) ; => 0.78333
(max-average-ratio '((2 4) (3 9) (4 5) (2 10)) 4) ; => 0.53485
