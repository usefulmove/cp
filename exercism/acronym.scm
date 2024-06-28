(import (rnrs))

(define (acronym test)
  (list->string 
   (car 
    (fold-left
     (lambda (acc c)
       (let ((acronym-list (car acc))
             (previous-char (cdr acc)))
         (if (and (or (char=? previous-char #\space)
                      (char=? previous-char #\-))
                  (and (not (char=? c #\space))
                       (not (char=? c #\-))))
             (cons (append acronym-list (list (char-upcase c))) ; update acronym-list
                   c)
             (cons acronym-list
                   c))))
     (cons '() #\space) ; (acronym-list . previous-char)
     (filter
      (lambda (c) (or (char-alphabetic? c)
                      (char=? c #\space)
                      (char=? c #\-)))
      (string->list test))))))

(display 
 (acronym "Portable Network Graphics"))
(newline)
(display 
 (acronym "Something - I made up from thin air"))
(newline)
(display 
 (acronym "The Road _Not_ Taken"))
(newline)
(display 
 (acronym "Complementary metal-oxide semiconductor"))
(newline)
