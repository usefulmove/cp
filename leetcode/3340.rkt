#lang racket

(define (is-balanced num)
  (let ((digits (map
                 (lambda (c)
                   (- (char->integer c) 48))
                 (string->list num))))
    (let loop ((even #t)
               (digs digits)
               (sum 0))
      (if (empty? digs)
          (= 0 sum)
            (loop (not even)
                  (cdr digs)
                  (+ sum (if even (car digs) (- (car digs)))))))))

(define (is-balanced num)
  (let ((digits (map
                 (lambda (c)
                   (- (char->integer c) 48))
                 (string->list num))))
    (let loop ((even #t)
               (digs digits)
               (sum-evens 0)
               (sum-odds 0))
      (if (empty? digs)
          (= sum-evens sum-odds)
          (loop (not even)
                (cdr digs)
                (+ sum-evens (if even (car digs) 0))
                (+ sum-odds (if even 0 (car digs))))))))

(is-balanced "1234")
(is-balanced "24123")
