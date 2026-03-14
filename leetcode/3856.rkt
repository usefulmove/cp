(require srfi/13)

(define (trim-trailing-vowels s)
  (string-trim-right
   s
   (lambda (c)
     (member c '(#\a #\e #\i #\o #\u)))))
