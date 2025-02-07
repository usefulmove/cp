#lang racket

(define (query-results limit queries)
  (let ((update-balls (lambda (balls index color)
                        (append (take balls index)
                                (list color)
                                (drop balls (+ index 1)))))
        (count-colors (lambda (balls)
                        (let loop ((bs balls)
                                   (seen '(0))
                                   (cnt 0))
                          (if (empty? bs)
                              cnt
                              (let ((color (car bs)))
                                (if (member color seen)
                                    (loop (rest bs)
                                          seen
                                          cnt)
                                    (loop (rest bs)
                                          (cons color seen)
                                          (+ cnt 1)))))))))
    (let loop ((qs queries)
               (balls (make-list (+ limit 1) 0))
               (output '()))
      (if (empty? qs)
          (reverse output)
          (let* ((query (car qs))
                 (updated-balls (update-balls
                                 balls
                                 (first query)
                                 (second query))))
            (loop (rest qs)
                  updated-balls
                  (cons (count-colors updated-balls) output)))))))

(query-results 4 '((1 4) (2 5) (1 3) (3 4)))
(query-results 4 '((0 1) (1 2) (2 2) (3 4) (4 5)))
