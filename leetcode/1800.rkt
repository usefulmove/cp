#lang racket

(define (max-ascending-sum nums)
  (letrec ((n (length nums))
           (ascending? (lambda (ns)
                         (or (or (empty? ns)
                                 (empty? (rest ns)))
                             (let ((a (first ns))
                                   (b (second ns)))
                               (and (> b a)
                                    (ascending? (rest ns)))))))
           (sublist (lambda (ns i j)
                      (drop (take ns j) i))))
    (foldl
     (lambda (i outer-max-so-far)
       (foldl
        (lambda (j inner-max-so-far)
          (let* ((sub (sublist nums i j))
                 (sum (apply + sub)))
            (if (and (ascending? sub)
                     (> sum inner-max-so-far))
                sum
                inner-max-so-far)))
        outer-max-so-far
        (range (+ i 1) (+ n 1)))) ; j
     0
     (range n)))) ; i

#;(define (max-ascending-sum nums)
  (let ((n (length nums))
        (ascending? (lambda (ns)
                      (let ((b (length ns)))
                        (if (< b 2)
                            #t
                            (andmap
                             <
                             (take ns (- b 1))
                             (cdr ns))))))
        (sublist (lambda (ns i j)
                   (drop (take ns j) i)))
        (max-so-far 0))
    (for ((i (range n)))
      (for ((j (range (+ i 1) (+ n 1))))
        (let* ((sub (sublist nums i j))
               (sum (apply + sub)))
          (if (and (ascending? sub)
                   (> sum max-so-far))
              (set! max-so-far sum)
              (void)))))
    max-so-far))

(max-ascending-sum '(10 20 30 5 10 50))
(max-ascending-sum '(10 20 30 40 50))
(max-ascending-sum '(12 17 15 13 10 11 12))
