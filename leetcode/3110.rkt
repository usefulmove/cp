#lang racket


#;(define (score-of-string s)
  (car (let ((asciis (map
                      char->integer
                      (string->list s))))
         (foldl
          (lambda (current acc)
            (let ((score (car acc))
                  (previous (cdr acc)))
              (cons (+ score
                       (abs (- current previous)))
                    current)))
          (cons 0 (car asciis)) ; (score . previous)
          asciis))))


(define (score-of-string s)
  (car (let ((chars (string->list s)))
         (foldl
          (lambda (current acc)
            (let ((score (car acc))
                  (previous (cdr acc)))
              (cons (+ score (abs (- (char->integer current)
                                     (char->integer previous))))
                    current)))
          (cons 0 (car chars)) ; (score . previous)
          chars))))


#;(define (score-of-string s)
  (let* ((zip-with (lambda (f lst . lsts)
                     (apply map f lst lsts)))
         (adjacent-map (lambda (f lst)
                         (zip-with
                          f
                          (drop-right lst 1)
                          (cdr lst)))))
    (apply + (adjacent-map
              (lambda (a b)
                (abs (- (char->integer a)
                        (char->integer b))))
              (string->list s)))))


(score-of-string "hello")
(score-of-string "zaz")
