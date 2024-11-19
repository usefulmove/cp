#lang racket

(provide encode decode)

(define (encode text)
  (let loop ((chars (string->list text))
             (repetitions 1)
             (decoded-chars '()))
    (if (empty? chars)
        (apply string (reverse decoded-chars))
        (let ((current-char (car chars))
              (rest (cdr chars)))
          (if (empty? rest)
              (if (= repetitions 1)
                  (loop '()
                        1
                        (cons current-char decoded-chars))
                  (loop '()
                        1
                        (append (cons current-char
                                      (reverse
                                       (string->list
                                        (number->string repetitions))))
                                decoded-chars)))
              (let ((next-char (car rest)))
                (if (not (equal? current-char next-char))
                    (if (= repetitions 1)
                        (loop (cdr chars)
                              1
                              (cons current-char decoded-chars))
                        (loop (cdr chars)
                              1
                              (append (cons current-char
                                            (reverse
                                             (string->list
                                              (number->string repetitions))))
                                      decoded-chars)))
                    (loop (cdr chars)
                          (+ repetitions 1)
                          decoded-chars))))))))

(define (decode code)
  (let loop ((chars (string->list code))
             (repetitions -1)
             (encoded-chars '()))
    (if (empty? chars)
        (apply string (reverse encoded-chars))
        (let ((current-char (car chars))
              (rest (cdr chars)))
          (if (empty? rest)
              (if (= repetitions -1)
                  (loop '()
                        -1
                        (cons current-char encoded-chars))
                  (loop '()
                        -1
                        (append (make-list repetitions current-char)
                                encoded-chars)))
              (let ((current-char (car chars)))
                (if (char-numeric? current-char)
                    (loop (cdr chars)
                          (+ (if (= repetitions -1)
                                 0
                                 (* repetitions 10))
                             (- (char->integer current-char) 48))
                          encoded-chars)
                    (loop (cdr chars)
                          -1
                          (append (make-list (max repetitions 1) current-char)
                                  encoded-chars)))))))))

#;(encode "aabcde")
#;(encode "abbbcde")
#;(encode "wwwwwwwwwwwwbwwwwwwwwwwwwbbbwwwwwwwwwwwwwwwwwwwwwwwwb")
#;(encode "aabcccdeeee")
#;(encode "  hsqq qww  ")

#;(decode "abcde")
#;(decode "a3bcde")
#;(decode "12wb12w3b24wb")

#;(decode (encode "wwwwwwwwwwwwbwwwwwwwwwwwwbbbwwwwwwwwwwwwwwwwwwwwwwwwb"))
