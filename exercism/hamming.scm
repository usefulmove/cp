(import (rnrs))

#;(define (hamming-distance strand-a strand-b)
  (let ((zip (lambda (lst . lsts)
               (apply map list lst lsts))))
    (cond ((= (string-length strand-a)
              (string-length strand-b))
           (fold-left
            (lambda (acc pair)
              (if (equal? (car pair)
                          (cadr pair))
                  acc
                  (+ 1 acc)))
            0
            (zip (string->list strand-a)
                 (string->list strand-b))))
          (else (error "strands are not the same length")))))


(define (hamming-distance strand-a strand-b)
  (let loop ((chars-a (string->list strand-a))
             (chars-b (string->list strand-b))
             (result 0))
    (cond ((and (null? chars-a)
                (null? chars-b)) result)
          ((or (null? chars-a)
               (null? chars-b)) (error "strands are not the same length"))
          ((equal? (car chars-a)
                   (car chars-b)) (loop (cdr chars-a)
                                        (cdr chars-b)
                                        result))
          (else (loop (cdr chars-a)
                      (cdr chars-b)
                      (+ result 1))))))

(hamming-distance "GAGCCTACTAACGGGAT" "CATCGTAATGACGGCCT") ; => 7
