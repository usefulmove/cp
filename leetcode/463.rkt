#lang racket


(define (island-perimeter grid)
  (let* ((num-rows (length grid))
         (num-cols (length (car grid)))
         (zip (lambda (lst . lsts)
                 (apply map list lst lsts)))
         (elements (foldl
                    (lambda (enum-row acc)
                      (let ((row-id (car enum-row))
                            (row (cadr enum-row)))
                        (append acc
                                (map
                                 (lambda (enum-value)
                                   (let ((col-id (car enum-value))
                                         (value (cadr enum-value)))
                                     (list value row-id col-id)))
                                 (zip (range num-cols) row)))))
                    '()
                    (zip (range num-rows) grid)))
         (element-val car)
         (element-row cadr)
         (element-col caddr)
         (get-value (lambda (row col)
                      (if (and (member row (range num-rows))
                               (member col (range num-cols)))
                          (element-val
                           (car
                            (filter
                             (lambda (element)
                               (and (equal? row (element-row element))
                                    (equal? col (element-col element))))
                             elements)))
                          0)))
         (get-neighbors (lambda (element)
                          (+ (get-value (element-row element)
                                        (add1 (element-col element)))
                             (get-value (element-row element)
                                        (sub1 (element-col element)))
                             (get-value (add1 (element-row element))
                                        (element-col element))
                             (get-value (sub1 (element-row element))
                                        (element-col element)))))
         (count-edges (lambda (element)
                        (if (zero? (element-val element))
                            0
                            (- 4 (get-neighbors element))))))

    (foldl
     (lambda (element edges)
       (+ edges
          (count-edges element)))
     0
     elements)))


(island-perimeter '((0 1 0 0) (1 1 1 0) (0 1 0 0) (1 1 0 0)))
