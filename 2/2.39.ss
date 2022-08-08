(load "D:/projects/mine/sicp/2/lib/accumulate.ss")

(define (reverse sequence)
  (fold-right
    (lambda (x y) (append y (list x)))
    '()
    sequence)
)

(define x (list 1 2 3 4 5 6))

(display (reverse x)) (newline)

(define (reverse sequence)
  (fold-left
    (lambda (x y) (cons y x))
    '()
    sequence)
)

(display (reverse x)) (newline)

(exit)
