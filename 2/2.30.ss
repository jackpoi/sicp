(load "D:/projects/mine/sicp/1/lib/power.ss")

(define (square-tree tree)
  (cond ((null? tree) '())
    ((not (pair? tree)) (square tree))
    (else (cons (square-tree (car tree)) (square-tree (cdr tree))))
  )
)

(define x (list 1 (list 2 (list 3 4) 5) (list 6 7)))
(display x) (newline)
(display (square-tree x)) (newline)

(define (square-tree tree)
  (map
    (lambda (sub)
      (if (pair? sub)
        (square-tree sub)
        (square sub)))
    tree
  )
)

(display x) (newline)
(display (square-tree x)) (newline)

(exit)
