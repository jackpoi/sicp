(load "D:/projects/mine/sicp/1/lib/power.ss")

(define (square-list items)
  (if (null? items)
    '()
    (cons (square (car items))
          (square-list (cdr items)))
  )
)

(display (square-list '(1 2 3 4)))

(define (square-list items)
  (map square items)
)

(newline)
(display (square-list '(1 2 3 4)))

(exit)
