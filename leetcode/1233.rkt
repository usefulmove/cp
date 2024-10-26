#lang racket

(define (remove-subfolders string-folder-list)
  (letrec ((subfolder? (lambda (test folder)
                         (cond ((> (length test)
                                   (length folder)) #f)
                               ((null? test) #t)
                               ((equal? (car test)
                                        (car folder)) (subfolder? (cdr test) (cdr folder)))
                               (else #f))))
           (folder-list (map
                         (lambda (s)
                           (string-split s "/"))
                         string-folder-list)))
    (map
     (lambda (list)
       (string-join list "/" #:before-first "/"))
     (foldl
      (lambda (comparison-folder acc-folder-list)
        (filter
         (lambda (folder)
           (if (equal? folder comparison-folder)
               #t
               (not (subfolder? comparison-folder folder))))
         acc-folder-list))
      folder-list
      folder-list))))
