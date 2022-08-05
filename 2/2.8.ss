(load "D:/projects/mine/sicp/2/lib/interval.ss")

(define (sub-interval x y)
  (make-interval (- (lower-bound x) (upper-bound y))
                 (- (upper-bound x) (lower-bound y)))
)

(define x (make-interval 1.1 2.2))
(define y (make-interval 1.5 3.2))
(print-interval x)
(print-interval y)
(print-interval (sub-interval x y))

(exit)
