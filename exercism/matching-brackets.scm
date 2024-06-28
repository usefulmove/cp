(import (rnrs))


(define (balanced? string)
  (let ((normalized-string (list->string 
                         (filter
                          (lambda (char)
                            (member char (string->list "(){}[]")))
                          (string->list string)))))
    (let ((reduced-string (reduce-string normalized-string)))
      (cond ((string=? reduced-string normalized-string) ; converged?
             (string=? "" reduced-string)) ; fully reduced?
            (else (balanced? reduced-string))))))


(define reduce-string
  (lambda (string)
           (if (equal? "" string)
               ""
               (letrec* ((remove-bracket-pairs
                         (lambda (pairs)
                           (cond ((null? pairs) '())
                                 ((= 1 (length pairs)) (map car pairs))
                                 (else 
                                  (let* ((first-pair (car pairs))
                                         (char (car first-pair))
                                         (char-next (cadr first-pair)))
                                    (if (or (and (equal? char #\{)
                                                 (equal? char-next #\}))
                                            (and (equal? char #\()
                                                 (equal? char-next #\)))
                                            (and (equal? char #\[)
                                                 (equal? char-next #\])))
                                        (remove-bracket-pairs (drop 2 pairs))
                                        (cons char
                                              (remove-bracket-pairs (cdr pairs)))))))))
                        (chars (string->list string))
                        (currents-and-nexts (zip chars ; (current . next)
                                                 (append (cdr chars) (list #\_)))))
                 (list->string
                  (remove-bracket-pairs currents-and-nexts))))))


(define (zip . lsts)
  (cond ((null? lsts) '())
        ((any? (lambda (o) o) (map null? lsts)) '())
        (else (cons (map car lsts)
                    (apply zip (map cdr lsts)))))) 


(define (any? f lst)
  (cond ((null? lst) #f)
        ((f (car lst)) #t)
        (else (any? f (cdr lst)))))


(define (drop n lst)
  (cond ((null? lst) '())
        ((= 0 n) lst)
        (else (drop (- n 1) (cdr lst)))))
