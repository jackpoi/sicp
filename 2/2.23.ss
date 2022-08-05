(load "D:/projects/mine/sicp/1/lib/power.ss")

(define (for-each f items)
  (if (not (null? items))
    (begin 
      (f (car items)) 
      (for-each f (cdr items))))
)

(define (square-list items)
  (for-each (lambda (x) (newline) (display (square x))) items)
)

(square-list '(1 2 3 4))

(exit)
