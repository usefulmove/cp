#lang racket

(define (min-increment-for-unique nums (initial-moves 0))
  (let ((output (foldl
                 (lambda (num acc)
                   (let ((updated-nums (car acc))
                         (seen (cadr acc))
                         (moves (caddr acc)))
                     (if (member num seen)
                         (list (append updated-nums (list (+ 1 num))) ; increment
                               seen ; no changes to seen
                               (+ 1 moves)) ; record increment
                         (list (append updated-nums (list num)) ; add num unchanged
                               (cons num seen) ; add num to seen
                               moves)))) ; no update to moves
                 (list '()
                       '()
                       initial-moves) ; (updated-nums seen moves)
                 nums)))
    (let ((updated-nums (car output))
          (seen (cadr output))
          (moves (caddr output)))
      (if (= (length updated-nums)
             (length seen))
          moves
          (min-increment-for-unique updated-nums moves)))))

(min-increment-for-unique '(1 2 2))
(min-increment-for-unique '(3 2 1 2 1 7))
