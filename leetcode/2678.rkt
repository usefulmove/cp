#lang racket

(define (count-seniors details)
  (count
   (lambda (passenger-detail)
     (let* ((age-string (substring passenger-detail 11 13))
            (age (string->number age-string)))
       (> age 60)))
   details))
