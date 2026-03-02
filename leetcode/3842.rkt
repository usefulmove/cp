(define (toggle-light-bulbs bulbs)
  (let ((ons (foldl
              (lambda (bulb acc)
                (if (member bulb acc)
                    (remove bulb acc)
                    (cons bulb acc)))
              '()
              bulbs)))
    (sort ons <)))
