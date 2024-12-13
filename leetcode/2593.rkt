#lang racket

(define (find-score nums)
  (letrec ((nums-pairs (let loop ((ns nums)
                                  (output '()))
                         (if (empty? ns)
                             (reverse output)
                             (loop (cdr ns)
                                   (cons (cons (car ns) #f)
                                         output)))))
           (all-marked? (lambda (lst)
                          (cond ((empty? lst) #t)
                                ((cdar lst) (all-marked? (cdr lst)))
                                (else #f)))))
    (let loop ((nps nums-pairs)
               (score 0))
      (if (all-marked? nps)
          score
          (let* ((min-pair (let loop ((pairs nps)
                                      (ind 0)
                                      (min-so-far 10e6)
                                      (min-so-far-index -1))
                             (if (empty? pairs)
                                 (cons min-so-far-index min-so-far)
                                 (let ((num (caar pairs))
                                       (marked (cdar pairs)))
                                   (if (and (not marked)
                                            (< num min-so-far))
                                       (loop (cdr pairs)
                                             (+ ind 1)
                                             num
                                             ind)
                                       (loop (cdr pairs)
                                             (+ ind 1)
                                             min-so-far
                                             min-so-far-index))))))
                 (min-marked-index (car min-pair))
                 (minimum (cdr min-pair))
                 (updated-nps (let loop ((ps nps)
                                         (ind 0)
                                         (output '()))
                                (if (empty? ps)
                                    (reverse output)
                                    (let ((num (caar ps))
                                          (marked (cdar ps)))
                                      (loop (cdr ps)
                                            (+ ind 1)
                                            (cons (cons num
                                                        (if (or (= ind min-marked-index)
                                                                (= ind (+ min-marked-index 1))
                                                                (= ind (- min-marked-index 1)))
                                                            #t
                                                            marked))
                                                  output)))))))
            (loop updated-nps
                  (+ score minimum)))))))

(find-score '(2 1 3 4 5 2)) ; => 7
(find-score '(2 3 5 1 3 2)) ; => 5
