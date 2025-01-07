#lang racket

(define (shifting-letters s shifts)
  (let* ((alpha-root (char->integer #\a))
         (shift-char (lambda (c shift)
                       (integer->char (+ (remainder
                                          (- (+ (char->integer c)
                                                shift)
                                             alpha-root)
                                          26)
                                         alpha-root)))))
    (list->string
     (let loop ((cs (reverse (string->list s)))
                (ss (reverse shifts))
                (acc 0)
                (output '()))
       (if (empty? cs)
           output
           (let ((c (car cs))
                 (shift (car ss)))
             (loop (cdr cs)
                   (cdr ss)
                   (+ acc shift)
                   (cons (shift-char c (+ shift acc)) output))))))))

#;(define (shifting-letters s shifts)
  (let* ((alpha-root (char->integer #\a))
         (shift-char (lambda (c shift)
                       (integer->char (+ (remainder
                                          (- (+ (char->integer c)
                                                shift)
                                             alpha-root)
                                          26)
                                         alpha-root)))))
  (list->string
   (map
    (lambda (pair)
      (let* ((ind (car pair))
             (c (cdr pair)))
        (shift-char c (apply + (drop shifts ind)))))
    (let loop ((chars (string->list s))
               (index 0)
               (output '()))
      (if (empty? chars)
          (reverse output)
          (loop (cdr chars)
                (+ index 1)
                (cons (cons index (car chars))
                      output))))))))

(shifting-letters "abc" '(3 5 9)) ; => "rpl"
(shifting-letters "aaa" '(1 2 3)) ; => "gfd"
(shifting-letters "bad" '(10 20 30)) ; => "jyh"
