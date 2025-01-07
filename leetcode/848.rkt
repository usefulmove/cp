#lang racket

(define (shifting-letters s shifts)
  (let ((shift-char (lambda (c shift)
                      (integer->char (+ (char->integer #\a)
                                        (remainder
                                         (- (+ (char->integer c)
                                               shift)
                                            (char->integer #\a))
                                         26))))))
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
