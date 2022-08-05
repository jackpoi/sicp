(load "D:/projects/mine/sicp/2/lib/interval.ss")

(define (par1 r1 r2)
  (div-interval (mul-interval r1 r2) (add-interval r1 r2))
)

(define (par2 r1 r2)
  (let ((one (make-interval 1 1)))
    (div-interval one (add-interval (div-interval one r1) (div-interval one r2)))
  )
)

(define R1 (make-center-percent 50000 0.001))
(define R2 (make-center-percent 80000 0.001))
(define p1 (par1 R1 R2))
(define p2 (par2 R1 R2))

(display (center p1))
(newline)
(display (percent p1))
(newline)

(display (center p2))
(newline)
(display (percent p2))
(newline)

(define A R1)
(define B R2)

; A/A
(define d1 (div-interval A A))
(print-interval d1) ; A/A != 1
(newline)
(display (center d1))
(newline)
(display (percent d1))
(newline)

; A/B
(define d2 (div-interval A B))
(print-interval d2)
(newline)
(display (center d2))
(newline)
(display (percent d2))

(exit)
