(defun range (&rest args)
  (let ((from (if (= 1 (length args))
                  0
                (car args)))
        (to (if (= 1 (length args))
                (car args)
              (cadr args)))
        (step (if (= 3 (length args))
                  (caddr args)
                1)))
    (cond ((>= from to) '())
          (t (cons from (range (+ step from) to step))))))

(defun sum-of-squares (n)
  (seq-reduce
   (lambda (acc a) (+ acc (* a a)))
   (range 1 (+ n 1))
   0))

(defun square-of-sum (n)
  (let ((sum (apply '+ (range 1 (+ n 1)))))
    (* sum sum)))

(defun difference (n)
  (- (square-of-sum n)
     (sum-of-squares n)))
