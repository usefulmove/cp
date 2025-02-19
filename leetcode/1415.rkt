#lang racket

(define (get-happy-string n k)
  (let ((happy-strings '())
        (cs '(#\a #\b #\c)))
    (let loop ((out '()))
      (cond ((= (length out) n)
             (set! happy-strings (cons out happy-strings)))
            ((empty? out) (for ((c cs))
                            (loop (cons c out))))
            (else (for ((c cs))
                    (if (equal? c (car out))
                        (void)
                        (loop (cons c out)))))))
    (let ((cnt (length happy-strings)))
      (if (> k cnt)
          ""
          (list->string (reverse (list-ref
                                  happy-strings
                                  (- cnt k))))))))

(get-happy-string 1 3) ; => "c"
(get-happy-string 1 4) ; => ""
(get-happy-string 3 9) ; => "cab"
