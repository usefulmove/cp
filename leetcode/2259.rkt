#lang racket

#|
Iterate through a reversed list of the `number` string characters to find the index (`last-index`) of the last occurence of `digit`. Then iterate forward through the list of characters. If the current character is equal to `digit` and is smaller than the next character (or is the last character equal to digit - index equal to `last-index`), remove that character. Otherwise, continue if no digit has yet been replaced (`done` equal to #f).
|#

(define (remove-digit number digit)
  (let* ((digits (string->list number))
         (last-index (let loop ((digs (reverse digits))
                                (ind (- (length digits)  1)))
                       (if (equal? (car digs) digit)
                           ind
                           (loop (cdr digs)
                                 (- ind 1))))))
    (let loop ((digs digits)
               (loop-ind 0)
               (done #f)
               (out '()))
      (cond ((empty? digs) (list->string (reverse out)))
            (done (loop (cdr digs)
                        (+ loop-ind 1)
                        done
                        (cons (car digs) out)))
            ((= loop-ind last-index) (loop (cdr digs)
                                           (+ loop-ind 1)
                                           #t
                                           out))
            ((and (equal? (car digs) digit)
                  (> (char->integer (cadr digs))
                     (char->integer (car digs)))) (loop (cdr digs)
                                                        (+ loop-ind 1)
                                                        #t
                                                        out))
            (else (loop (cdr digs)
                        (+ loop-ind 1)
                        done
                        (cons (car digs) out)))))))

(remove-digit "123" #\3) ; => "12"
(remove-digit "1231" #\1) ; => "231"
(remove-digit "551" #\5) ; => "51"
