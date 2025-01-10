#lang racket

(define (shifting-letters s shifts)
  (let* ((alpha-root (char->integer #\a))
         (shift-char (lambda (c direction)
                       (cond ((and (equal? c #\a)
                                   (= direction 0)) #\z)
                             ((and (equal? c #\z)
                                   (= direction 1)) #\a)
                             (else (integer->char (+ (char->integer c)
                                                     (if (= 0 direction) -1 1)))))))
         (len (string-length s))
         (set-value (lambda (cs-init index value)
                      (append (take cs-init index)
                              (list value)
                              (drop cs-init (+ index 1)))))
         (apply-shift (lambda (cs-init shift)
                        (let ((start (first shift))
                              (end (second shift))
                              (dir (third shift)))
                          (let loop ((ind 0)
                                     (cs cs-init))
                            (if (= ind len)
                                cs
                                (loop (+ ind 1)
                                      (if (and (>= ind start)
                                               (<= ind end))
                                          (set-value cs ind (shift-char (list-ref cs ind) dir))
                                          cs))))))))
    (list->string (foldl
                   (lambda (shift acc)
                     (apply-shift acc shift))
                   (string->list s)
                   shifts))))

(shifting-letters "abc" '((0 1 0) (1 2 1) (0 2 1))) ; => "ace"
(shifting-letters "dztz" '((0 0 0) (1 1 1))) ; => "catz"
