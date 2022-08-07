(define (subsets s)
  (if (null? s)
    (list '())
    (let ((rest (subsets (cdr s))))
      (append rest (map (lambda (x) (cons (car s) x)) rest))
    )
  )
)

(define x (list 1 2 3))
(display x) (newline)
(display (subsets x))


(define x (list 1 2 3 4 5))
(newline)
(display (filter (lambda (x) (begin (display "filter: ") (odd? x))) (map (lambda (x) (begin (display "map: ") (* x x))) x)))
(exit)
