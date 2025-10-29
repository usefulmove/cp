#lang racket

(define (num-rescue-boats people limit (previous-boats 0))
  (if (null? people)
      previous-boats
      (let* ((first-person (car people))
             (everyone-else (cdr people))
             (second-person (cond ((= limit first-person) -1)
                                  (else (let ((options (filter
                                                        (lambda (person)
                                                          (<= person (- limit first-person)))
                                                        everyone-else)))
                                          (if (null? options)
                                              -1
                                              (car options)))))))
        (cond ((= -1 second-person) (num-rescue-boats
                                     everyone-else
                                     limit
                                     (+ 1 previous-boats)))
              (else (num-rescue-boats
                     (remove second-person everyone-else)
                     limit
                     (+ 1 previous-boats)))))))

(num-rescue-boats '(1 2) 3)
(num-rescue-boats '(3 2 2 1) 3)
(num-rescue-boats '(3 5 3 4) 5)
