(load "D:/projects/mine/sicp/1/lib/power.ss")
(load "D:/projects/mine/sicp/2/lib/accumulate.ss")

(define (map p sequence)
  (accumulate (lambda (x y) (cons (p x) y)) '() sequence)
)

(define x (list 1 2 3))

(display (map square x)) (newline)

(define (append seq1 seq2)
  (accumulate cons seq2 seq1)
)

(define y (list 4 5 6))
(display (append x y)) (newline)

(define (length sequence)
  (accumulate (lambda (x y) (+ 1 y)) 0 sequence)
)

(display (length x)) (newline)

(exit)
