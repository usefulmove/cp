#lang racket

(define (find-valid-pair s)
  (let* ((chars (string->list s))
         (char->value (lambda (c)
                        (- (char->integer c)
                           (char->integer #\0))))
         (count-pairs (foldl
                       (lambda (c cnts-so-far)
                         (let ((count-pair (assoc c cnts-so-far)))
                           (if count-pair
                               (cons (cons c (+ (cdr count-pair) 1))
                                     (remove count-pair cnts-so-far))
                               (cons (cons c 1)
                                     cnts-so-far))))
                       '()
                       (string->list s)))
         (get-count (lambda (c)
                      (cdr (assoc c count-pairs)))))
    (foldl
     (lambda (c1 c2 acc)
       (cond ((not (equal? acc "")) acc)
             ((equal? c1 c2) acc)
             ((and (= (get-count c1)
                      (char->value c1))
                   (= (get-count c2)
                      (char->value c2))) (list->string (list c1 c2)))
             (else acc)))
     ""
     (take chars (- (length chars) 1))
     (drop chars 1))))

(find-valid-pair "2523533")
(find-valid-pair "221")
(find-valid-pair "22")
