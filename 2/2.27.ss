(define (deep-reverse tree)
  (cond ((null? tree) '())
    ((not (pair? tree)) tree)
    (else (append (deep-reverse (cdr tree)) 
                  (list (deep-reverse (car tree)))))
  )
)

(define x (list (list 1 2) (list 3 4 5)))
(display (deep-reverse x))

(exit)
