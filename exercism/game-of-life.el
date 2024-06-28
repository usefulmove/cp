;;; game-of-life.el --- Conway's Game of Life (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(defun tick (matrix)
  (let ((cell-alive? (lambda (cell)
                       (not (= 0 cell))))
        (cell-dead 0)
        (cell-alive 1))
    (mapcar
     (lambda (row-pair)
       (let ((row-ind (car row-pair))
             (row (cdr row-pair)))
         (mapcar
          (lambda (cell-pair)
            (let* ((col-ind (car cell-pair))
                   (cell (cdr cell-pair))
                   (get-value (lambda (matrix row col)
                                (let ((num-rows (length matrix))
                                      (num-cols (length (car matrix))))
                                  (cond ((or (< row 0)
                                             (< col 0)
                                             (>= row num-rows)
                                             (>= col num-cols)) 0)
                                        (t (nth col (nth row matrix)))))))
                   (neighbors (+ (funcall get-value matrix (- row-ind 1) (- col-ind 1))
                                 (funcall get-value matrix (- row-ind 1) col-ind)
                                 (funcall get-value matrix (- row-ind 1) (+ col-ind 1))
                                 (funcall get-value matrix row-ind (- col-ind 1))
                                 (funcall get-value matrix row-ind (+ col-ind 1))
                                 (funcall get-value matrix (+ row-ind 1) (- col-ind 1))
                                 (funcall get-value matrix (+ row-ind 1) col-ind)
                                 (funcall get-value matrix (+ row-ind 1) (+ col-ind 1)))))
              (cond ((funcall cell-alive? cell)
                     (if (or (= 2 neighbors)
                             (= 3 neighbors))
                         cell-alive
                       cell-dead))
                    (t (if (= 3 neighbors)
                           cell-alive
                         cell-dead)))))
          (enumerate row))))
     (enumerate matrix))))


;; enumerate :: [T] -> [[integer . T]]
(defun enumerate (lst &rest args)
  "Enumerate the list (LST) by returning an association list whose elements are
the element index (0-based) and the element itself."
  (let ((index (if (null args)
                   0
                 (car args))))
    (if (null lst)
        '()
      (cons (cons index (car lst))
            (enumerate (cdr lst) (+ 1 index))))))


(provide 'game-of-life)
;;; game-of-life.el ends here
