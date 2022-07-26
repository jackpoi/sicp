(load "D:/projects/mine/sicp/1/lib/power.ss")

(define (compose f g)
  (lambda (x) (f (g x)))
)

(display ((compose square inc) 6))

(exit)
