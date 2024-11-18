#lang racket

(define (decrypt code k)
  (let* ((code-length (length code))
         (code-list (if (< k 0)
                        (reverse code)
                        code))
         (decrypt-pos (lambda (pos)
                        (apply + (map
                                  (lambda (offset)
                                    (list-ref
                                     code-list
                                     (remainder (+ pos offset) code-length)))
                                  (range 1 (+ (abs k) 1)))))))
    (let loop ((cls code-list)
               (res '())
               (pos 0))
      (if (empty? cls)
          (if (< k 0)
              res
              (reverse res))
          (loop (cdr cls)
                (cons (decrypt-pos pos)
                      res)
                (+ pos 1))))))

(decrypt '(5 7 1 4) 3)
(decrypt '(1 2 3 4) 0)
(decrypt '(2 4 9 3) -2)
