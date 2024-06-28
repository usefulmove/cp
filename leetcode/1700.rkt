#lang racket


(define (count-students students sandwiches)
  (if (empty? sandwiches)
      (length students)
      (let* ((available-sandwich (car sandwiches))
             (remaining-sandwiches (cdr sandwiches))
             (students-round (count zero? students))
             (students-square (- (length students)
                                 students-round)))
        (cond ((= available-sandwich 0)
               (if (zero? students-round)
                   (+ students-round students-square)
                   (count-students
                    (append (make-list (sub1 students-round) 0)
                            (make-list students-square 1))
                    remaining-sandwiches)))
              ((= available-sandwich 1)
               (if (zero? students-square)
                    (+ students-round students-square)
                    (count-students
                     (append (make-list students-round 0)
                             (make-list (sub1 students-square) 1))
                     remaining-sandwiches)))))))


(count-students '(1 1 0 0) '(0 1 0 1)) ; => 0
(count-students '(1 1 1 0 0 1) '(1 0 0 0 1 1)) ; => 3
