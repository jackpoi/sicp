(load "D:/projects/mine/sicp/2/lib/interval.ss")

(define x (make-interval 1.1 2.2))
(define y (make-interval 1.5 3.2))
(print-interval x)
(print-interval y)
(print-interval (add-interval x y))

(exit)
